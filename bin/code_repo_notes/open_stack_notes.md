# this is book reading note for openstack

### overview 

![fig001](https://photos.app.goo.gl/MoG9RQaLX1zfKRGr5)

设计哲学：big tent，到处是抽象

### virtualize

* 2 kinds of virtual, Nova use Libvirt as Hypervisor（VMM） manage tool

   * 建立libvirt 和VMM的链接 => libvirt 调用相对 VMM的接口

### Common 

* Communication

    * 调用后端MessageQueue的前端oslo.messaging抽象, 常用RabbitMQ, AMQP (inter a module, more cohesion, more config) [ref](https://www.cloudamqp.com/blog/2015-05-18-part1-rabbitmq-for-beginners-what-is-rabbitmq.html)

        * RPC sync & async 接口

        * Event Notyfication 接口

    * RestFul API & WSGI (between module, more general) [ref](http://www.cnblogs.com/sammyliu/p/4272611.html)

    * Eventlet (network lib with coroutine,貌似一点都不优美？)

* SQLAlchemy (deal with db)
<a name="cinder:cv"></a>
* TaskFlow的代码执行框架，方便追溯 (类似于数据库里事务的概念，在RPC可能失败的地方用到) [ref](https://wiki.openstack.org/wiki/TaskFlow#Big_picture)

    * Operation Progress --- Create A Volume with TaskFlow

            1. 准备参数
            2. 构造
                1. 构造create_what 参数  
                2. 构造flow
                    1. 初始化
                    2. 按顺序添加task到flow中
                        1.ExtractVolumeSpecTask （提取和验证输入的值
                        2.NotifyVolumeActionTash （db资源配额信息的更新
                        3.CreateVolumeFromSpecTask （调用后端
                        4.CreateVolumeOnFinishTask （收尾
                    3. 返回flow
                3. 执行flow
                    1. 如果没有错误，顺序执行
                    2. 如果有，按照task逆序来调用具体的逆转回滚方法来实现系统状态的恢复,根据情况是否retry
                4. 从执行的flow中返回信息
            3. 返回值检查和反馈

* other

### Nova

* Architecture Graph

    ![fig002](https://photos.app.goo.gl/ZmXuh9paUyRiQ6DF8)

* Operation Progress --- Create A Virtual Machine

        1. API to MessageQueue
        2. Conductor was invoked by MQ
        3. Conductor read info from DB
        4. tell Scheduler to schedule
        5. Conductor tell Compute to Do 'task'

* Operation Progress --- Live migration

    ![fig003](https://photos.app.goo.gl/poaoby2TipfBcaeZ7)
    
    内存脏页，共享存储

### Storage

* Comparison

    reference=[ref](https://cloudian.com/blog/object-storage-vs-block-storage/),[ref](https://cloudian.com/blog/object-storage-vs-file-storage/),[ref](https://www.zhihu.com/question/21536660),

    | OBS | DFS | BS | item |
    | --- | --- | -- | ---- |
    | Performs best for big content and high stream throughput |Performs best for smaller files  |Strong performance with database and transactional data  | Performs |
    | Data can be stored across multiple regions | Data typically needs to be shared locally | The further the distance between storage and application, the higher the latency | Geography |
    | Scales infinitely to petabytes and beyond | Potentially scales up to millions of files, but can’t handle more | Addressing requirements limit scalability | Scalability |
    | Customizable metadata allows data to be easily organized and retrieved | Limited number of set metadata tags | No metadata | Analytic |
    | key-based PUT GET 接口 | （类）文件存储接口 | Linux的Block Device的接口| Interface |

* OBS Swift --- cold data(effecient consider) [ref](https://www.swiftstack.com/docs/introduction/openstack_swift.html)

    * Archi

        ![Fig-3 p202](https://photos.app.goo.gl/YdRTnu5RzpFYPUC38)

        Pysical relationship : Zone -> Storage Node-> Device -> Partition (collection of OBJ)

        ![Fig-3 p205](https://photos.app.goo.gl/pvP3nBVjzTyU4WH49)

        updator 只会更新上一级，account updator是不存在的[见此](https://www.swiftstack.com/docs/introduction/openstack_swift.html#specialized-consistency-services)

        三个进程server，8个后台服务

        Logical relationship : Account -> Container -> OBJ

    * logical 2 physical ('Ring', a consistent hash，持续维护)

        - 3 ring for account db, container db, object

    * Swift API

    * Solve Consistency Problem (noraft)

        * NWR, write 2, read 2, replica 3

            - 1. how to replicate to another one when u write 2 - 'replicate_ob' method
            - 2. when data corrupt, auditor would notify replicator

        * Auditor, updater, Replicator

            * Auditor --- check data
            * updater --- gurantee write operator
            * replicator --- do check & replicating work (noraft, nolog, nostatemachine) 

                1. 通过hash值和同步点（标示谁最新）来检查一致
                2. 发送副本来完成复制

    * Operation Progress --- Write A OB

        read this : [one blog](https://blog.chmouel.com/2012/02/06/anatomy-of-a-swift-put-query-to-object-server/) [swift source code POST,PUT](https://github.com/openstack/swift/blob/master/swift/obj/server.py)
        Proxy Node -> storage node -> Account -> Container -> Object (which disk, which partition, which offset)

                    proxy server process will verify auth and then it find location of three partition by 'Ring'
                    proxy server 把 obj 发送到three partition所对应的storage node上的object server 上
                        对每一个object server，检查metadata，写metadata，写新文件
                    写成功两就标示成功
                    更新container信息

* BS Cinder --- hot data

    * Archi

        ![Fig-5](https://photos.app.goo.gl/DoWQrNrieDb1bQbp9)
        Cinder is just a logical frontend，可以有多个存储后端

    * Operation Progress --- Create A Volume
        1. scheduler决策后调用cinder-volume的cinder.volume.manager.VolumeManager.create_volume()
            [jump](#cinder:cv)

* Local storage for VM --- very hot data(swap.file ?)

* Glance --- just a logical frontend which invoke swift

* Ceph --- OBS + BS + DFS based on RADOS

### Neutron

* Network Virtualize

    * External network (network between Hypervisor)

        1. L2 VLAN
        2. L3 VPN, VRF
        3. L4 P2P

    * Internal network (network in a Hypervisor)

        1. L2 Linux TAP + Bridge
        2. L3 Linux TUN + Bridge + iptables

    * Component

        1. Device Virtual
        2. DataPathVirtual

### Keystone 

### Ceilometer

### Ironic

### Horizon

### Docker 

* Group Manage Tool

    - Docker Swarm

    - Kubernetes

        - Archi

            ![Fig-7]()

    - Mesos

* Other tool, OpenStack and docker

