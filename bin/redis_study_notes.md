<font color="green" size="6">
<a name="101redis"></a>
### Redis 
</font>

* Overview

    * wheels implemented hiself

        1. string 

            ```cpp
            struct sdshdr {

                // buf 已占用长度
                int len;

                // buf 剩余可用长度
                int free;

                // 实际保存字符串数据的地方
                char buf[];

            };

            struct sdshdr {
                len = 11;
                free = 0;
                buf = "hello world\0";  // buf 的实际长度为 len + 1

            };
            ```

        2. Hash(dictionary dict)

            0. dict & hash & hash entry :

                ```cpp
                /*
                 * 字典
                 *
                 * 每个字典使用两个哈希表，用于实现渐进式 rehash
                 */
                typedef struct dict {

                    // 特定于类型的处理函数
                    dictType *type;

                    // 类型处理函数的私有数据
                    void *privdata;

                    // 哈希表（2 个）
                    dictht ht[2];

                    // 记录 rehash 进度的标志，值为 -1 表示 rehash 未进行
                    int rehashidx;

                    // 当前正在运作的安全迭代器数量
                    int iterators;


                } dict;

                /*
                 * 哈希表
                 */
                typedef struct dictht {

                    // 哈希表节点指针数组（俗称桶，bucket）
                    dictEntry **table;

                    // 指针数组的大小
                    unsigned long size;

                    // 指针数组的长度掩码，用于计算索引值
                    unsigned long sizemask;

                    // 哈希表现有的节点数量
                    unsigned long used;


                } dictht;


                /*
                 * 哈希表节点
                 */
                typedef struct dictEntry {

                    // 键
                    void *key;

                    // 值
                    union {
                        void *val;
                        uint64_t u64;
                        int64_t s64;
                    
                    } v;

                    // 链往后继节点
                    struct dictEntry *next;

                } dictEntry;
                ```

            1. incremental rehash:(1)因为在 rehash 时，字典会同时使用两个哈希表，所以在这期间的所有查找、删除等操作，除了在 ht[0] 上进行，还需要在 ht[1] 上进行。(2) 在执行添加操作时，新的节点会直接添加到 ht[1] 而不是 ht[0] ，这样保证 ht[0] 的节点数量在整个 rehash 过程中都只减不增。(3) 这样做是为了避免rehash时，由于redis单线程属性而造成的延迟，发生的具体时间分两种，操作hash表时 和 定时任务性的rehash。

        3. two kinds of list 

            1. **ziplist** is a structured memory block, with metaheader and many entries, which can be used to store different kinds of types in each entry, where each entry has its own metadata used to info the operations on them. 

            2. **double linked list**, is a typic double linked list, instead of a huge structured memory block, and value is stored by a pointer within the linked list node. This data structure would be used when ziplist have too many entries.

        4. **inset** is a ds to store **int** in a continous memory in increasing order. ( I don't think this is good, comparison to std::set. )

    * Psudo Object oriented operation

        1. [flyweight pattern](https://en.wikipedia.org/wiki/Flyweight_pattern), redis use this [like this](http://origin.redisbook.com/datatype/object.html) to shared frequently used object, **more effective**

        2. pornimorphic in c, [ref](http://origin.redisbook.com/datatype/object.html), every obj is treated as 'redisobj' which contains a 'p'(point to the implment data) a 'tag'(indicate which kind of data structure that p point to). **for example, when you do delete a obj, redis need to check it's type, and invoke the correspond delete function.

            ```
            struct redisobj {
                void* p;
                int typeid;
                int refcount;
                //..
            };

            /*
             * 创建一个 hash 对象
             */
            robj *createHashObject(void) {
                unsigned char *zl = ziplistNew();
                robj *o = createObject(REDIS_HASH, zl);
                o->encoding = REDIS_ENCODING_ZIPLIST;
                return o;

            }
            ```

        3. smart pointer like implemented in c, using counter, when **'refcount' == 1**, delete it.

            ```cpp
            void decrefcount(void* obj) {
                redisobj* o = obj;
                if (refcount == 1) {
                    switch (o->type) {
                        case LISTTYPE :
                        case HASHTYPE :
                        //....
                    }
                } else {
                    //...
                }
            }

            // so every time you got an object, you must invoke decrefcount(obj)
            // for example delete identical field and value from a hash, 
            int hashTypeDelete(robj* hash, robj* field) {
                if (o->encoding == ZIPLIST) {
                    field = getDecodedObject(field);
                    // ... do delete
                    decrRefcount(field);
                } else if (o->encoding == HashTable) {
                    // do something
                }
            }

            // the real code is here 
            int hashTypeDelete(robj *o, robj *field) {
                int deleted = 0;
                // ziplist
                if (o->encoding == REDIS_ENCODING_ZIPLIST) {
                    unsigned char *zl, *fptr;
                    field = getDecodedObject(field);
                    // 遍历 ziplist ，尝试删除 field-value 对
                    zl = o->ptr;
                    fptr = ziplistIndex(zl, ZIPLIST_HEAD);
                    if (fptr != NULL) {
                        fptr = ziplistFind(fptr, field->ptr, sdslen(field->ptr), 1);
                        // 找到目标 field
                        if (fptr != NULL) {
                            zl = ziplistDelete(zl,&fptr);
                            zl = ziplistDelete(zl,&fptr);
                            o->ptr = zl;
                            deleted = 1;
                        }
                    }
                    decrRefCount(field);
                } else if (o->encoding == REDIS_ENCODING_HT) {
                    if (dictDelete((dict*)o->ptr, field) == REDIS_OK) {
                        deleted = 1;
                        /* Always check if the dictionary needs a resize after a delete. */
                        if (htNeedsResize(o->ptr)) dictResize(o->ptr);
                    }
                } else {
                    redisPanic("Unknown hash encoding");
                }
                return deleted;
            }
            ```

    * DB support

        1. DB struct & operation on it [check this](http://origin.redisbook.com/internal/db.html)

            ```cpp
            typedef struct redisDb {

                // 保存着数据库以整数表示的号码
                int id;

                // 保存着数据库中的所有键值对数据
                // 这个属性也被称为键空间（key space）
                dict *dict;

                // 保存着键的过期信息
                dict *expires;

                // 实现列表阻塞原语，如 BLPOP
                // 在列表类型一章有详细的讨论
                dict *blocking_keys;
                dict *ready_keys;

                // 用于实现 WATCH 命令
                // 在事务章节有详细的讨论
                dict *watched_keys;


            } redisDb;
            ```

        2. master/slave copy : only master can delete expired data, slave won't delete even if it finds it's expired.

        3. subcribe & publish pattern : when new key, would let client knows.

            ```cpp
            struct redisServer {
                // ...
                dict *pubsub_channels;
                // ...
            };
            ```
        
        4. duration : 
            | RDB | AOF | item |
            | - | - | - |
            | easy restart from. RDB 将数据库的快照（snapshot）以二进制的方式保存到磁盘中。| 则以协议文本的方式，将所有对数据库进行过写入的命令（及其参数）记录到 AOF 文件，以此达到记录数据库状态的目的。| usage |
            | BGSAVE, use 'COW' by calling forks. The child starts to write the dataset to a temporary RDB file.  When the child is done writing the new RDB file, it replaces the old one. | 与 RDB 不同的是，后台子进程持久化过程中，主进程会记录期间的所有数据变更（主进程还在服务） | tech |

        5. transaction : it's easy to support transaction in single thread server. Just set a flag and don't run other command unless your transaction is done. **ACID**, A : due to single thread, it's gurantee to be atomic. I : transaction won't be interrupted, so, isolated. C : check errer and legal. D : it depends what mode you use(no-duration? RDB? AOD?) , note redis is a memory db, no-duration means the modify would loss if crash.

        6. expired data, out of date :

    * Distributed support :
        
        1. sentinel :[redis org](https://redis.io/topics/sentinel)

* Other
    0. due to redis server is single thread, so its operation would be atomic, if you use transaction, it also would be atomic(redis server won't do other command unless your transaction is performed, where multiple command not in transaction would be non-atomic, because there is not only one client, your command queue might be interrupted by others command). Although this atomic gurantee is a weak gurantee, which don't gurantee the data still on when poweroff or shutdown( it's also not it's work of a in-memory db )
    1. redis server is single thread, so, it's much easier to implement.