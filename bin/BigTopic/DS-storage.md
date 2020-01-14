# Note for Distributed System storage

## templates

arbitary jump template

[check](#10fuck)
<a name="10fuck"></a>

color template

<font color="green" size="6">
<a name="fuccccc"></a>
fucckkkkk
</font>

## Table of contents

- [Note for Distributed System storage](#note-for-distributed-system-storage)
  - [templates](#templates)
  - [Table of contents](#table-of-contents)
  - [Common topic](#common-topic)
  - [Project](#project)
    - [GlusterFs](#glusterfs)
    - [AzureStorage](#azurestorage)
    - [AliPangu](#alipangu)
    - [File System Design In Linux](#file-system-design-in-linux)
  - [Trouble in Real World](#trouble-in-real-world)
  - [Unordered topic](#unordered-topic)


## Common topic

1. Compare
    1. [one paper compare six DFS at 2013](#https://hal.inria.fr/hal-00789086/document)
2. Architech
    1. Consistency: Log State Machine, Replica [read raft paper](https://raft.github.io/raft.pdf)
    2. Elastic: Load Balance and dynamic server elastic
3. Design Tech Terminology
    1. Crash Consistency problem & Journaling : The journal drive is dedicated solely for writing a single sequential journal of data, which allows us to reach the full write throughput potential of the device. [handouts](http://pages.cs.wisc.edu/~remzi/OSTEP/file-journaling.pdf)
    2. 静默错误: 硬件行业的人知道磁盘极小的概率发生静默错误（读出来的数据是错误的，但底层接口不报错，磁盘本身也不报错）
    3. Available Zone, Fault domain : Seperate network and power
    4. Scaling Computation Separate from Storage
    5. Map by Hash vs Map by Range : Hash is flexiable, Range gives more 'locality'
    6. Throttling/Isolation: When access pattern can't be loadbalanced, must throttle request of them.
    7. Deal with small flow : buffer and batch it
    8. Fail Over: use redudant resource to solve fail-condition.
    9. End-to-end Checksum: calculate once, check many times
    10. Rolling upgrade, online upgrade, 热升级
    11. TOR(top-of-rack) switch: which rack of machine has one switch
    12. Code Data Storage : Erasure code [read Azure Erasure Code Paper](https://www.usenix.org/system/files/conference/atc12/atc12-final181_0.pdf)
    13. RDMA(Remote Direct Memory Access)
        1. Tech related(omit)
        2. Main Concept
            1. RDMA Transfer Model(omit)
            2. Four type op
                1. Send
                2. RDMA Wrtie
                3. RDMA Read
                4. Atomic
        3. Main Feature
            1. CPU bypass
            2. Special HardWare & SoftWare Stack
        4. Ref: [Training Article From JD]()



## Project


### GlusterFs
    
* Overview

    1. no metadata & center control server

    Q: How it works ? 

    A: DFS(Distributed File System).user.filename --- algo ---> logic volume in pool --- DHT(Distributed Hash Table), less or more like consistency hash ---> machine

* Ref

    [Introduction,](http://moo.nac.uci.edu/~hjm/fs/An_Introduction_To_Gluster_ArchitectureV7_110708.pdf)
    [model,](https://events.static.linuxfound.org/sites/events/files/slides/Vault%202016-%20GlusterFS_and_its_distribution_model.pdf)
    [DHT,](http://www.taocloudx.com/index.php?a=shows&catid=4&id=66)
    [DHT,](https://my.oschina.net/uvwxyz/blog/182224)

### AzureStorage

* Overview

    1. Feature: 
        1. Deep hierarchy.
        2. Append only but can delete. 
    2. Architecture:
        1. URL: AccountName:Partition:Object
        2. client -> LocationService -> Storage Stamp
            1. LocationService :The location service manages all the storage stamps
            2. storage stamps:  A storage stamp is a cluster of N racks of storage nodes
        3. into storage stamp -> Front Ends -> Partition Layer -> Stream Layer
            1. Stream Layer: This layer stores the bits on disk and is in charge of distributing and replicating the data across many servers to keep data durable within a storage stamp.  It provides a file system like namespace and API, except that all writes are append-only. It allows clients (the partition layer) to open, close, delete, rename, read, append to, and concatenate these large files, which are called streams. A stream is an ordered list of extent pointers, and an extent is a sequence of append blocks.
                1. Block – This is the minimum unit of data for writing and reading.
                2. Extent – Extents are the unit of replication in the stream layer, and the default replication policy is to keep three replicas within a storage stamp for an extent.
                3. A stream is an ordered list of pointers to extents which is maintained by the Stream Manager.
                4. Stream Manager (SM) – The SM keeps track of the stream namespace, what extents are in each stream, and the extent allocation across the Extent Nodes (EN). 
                5. Extent Nodes (EN) – Each extent node maintains the storage for a set of extent replicas assigned to it by the SM. 
                6. commit length: As appends commit in order for a replica, the last append position is considered to be the current commit length of the replica.
                7. Sealing: From a high level, the SM coordinates the sealing operation among the ENs; it determines the commit length of the extent used for sealing based on the commit length of the extent replicas. Once the sealing is done, the commit length will never change again.
                8. Erasure coding sealed extents is an important optimization, given the amount of data we are storing. It reduces the cost of storing data from three full replicas within a stamp, which is three times the original data, to only 1.3x – 1.5x the original data, depending on the number of fragments used. In addition, erasure coding actually increases the durability of the data when compared to keeping three replicas within a stamp.
            2. Partition Layer: The partition layer is built for (a) managing and understanding higher level data abstractions (Blob, Table, Queue), (b) providing a scalable object namespace, (c) providing transaction ordering and strong consistency for objects, (d) storing object data on top of the stream layer, and (e) caching object data to reduce disk I/O
                1.  Object Table: The partition layer provides an important internal data structure called an Object Table (OT). An OT is a massive table which can grow to several petabytes.
                2.  Partition Manager (PM) – Responsible for keeping track of and splitting the massive Object Tables into RangePartitions and assigning each RangePartition to a Partition Server to serve access to the objects. 
                3.  Partition Server (PS) – A partition server is responsible for serving requests to a set of RangePartitions assigned to it by the PM. The PS stores all the persistent state of the partitions into streams and maintains a memory cache of the partition state for efficiency.
                4.  Lock Service – A Paxos Lock Service is used for leader election for the PM. 
                5.  RangePartition Memory Data Module
                    1.  Memory Table – This is the in-memory version of the commit log for a RangePartition, containing all of the recent updates that have not yet been checkpointed to the row data stream. When a lookup occurs the memory table is checked to find recent updates to the RangePartition.
                    2.  Index Cache – This cache stores the checkpoint indexes of the row data stream. We separate this cache out from the row data cache to make sure we keep as much of the main index cached in memory as possible for a given RangePartition.
                    3.  Row Data Cache – This is a memory cache of the checkpoint row data pages. The row data cache is read-only. When a lookup occurs, both the row data cache and the memory table are checked, giving preference to the memory table.
                    4.  Bloom Filters – If the data is not found in the memory table or the row data cache, then the index/checkpoints in the data stream need to be searched. It can be expensive to blindly examine them all. Therefore a bloom filter is kept for each checkpoint, which indicates if the row being accessed may be in the checkpoint.
                6.  Separate Stream in stream layer
                    1.  Metadata Stream – The metadata stream is the root stream for a RangePartition. The PM assigns a partition to a PS by providing the name of the RangePartition’s metadata stream. The metadata stream contains enough information for the PS to load a RangePartition, including the name of the commit log stream and data streams for that RangePartition, as well as pointers (extent+offset) into those streams for where to start operating in those streams (e.g., where to start processing in the commit log stream and the root of the index for the row data stream). The PS serving the RangePartition also writes in the metadata stream the status of outstanding split and merge operations that the RangePartition may be involved in.
                    2. Commit Log Stream – Is a commit log used to store the recent insert, update, and delete operations applied to the RangePartition since the last checkpoint was generated for the RangePartition.
                    3. Row Data Stream – Stores the checkpoint row data and index for the RangePartition.
                    4. Blob Data Stream – Is only used by the Blob Table to store the blob data bits.
                7. Operation (omit, see paper)
            3. FE: an FE looks up the AccountName, authenticates and authorizes the request, then routes the request to a partition server in the partition layer.
        4. Replication: Inter-Stamp and Intra-Stamp
            1. Inter-Stamp: hardware failures
            2. Intra-Stamp: geo-redundancy

* Detail

    Q: How 'Erasure Coding Sealed Extents' works, and reduce disk space cost?

    A: Assume you have two data-extents, A & B. At begining, you have three replica for A & B. Once they were sealed, replicas were deleted and Erasure code is processed for your data. Then You can create Erasure-code data C to reconstruct your data in case part of your data is broken insteads of replica. Note, 'Erasure coding' has bigger MTTF, and smaller MTBF.

    Q: What happen, if A & B in last question, were lost at the same time?

    A: First, 'Erasure code' is not that simple. But, WAS avoids these correlated failures by always placing fragments belonging to the same coding group in different fault domains. So, failures that serious enough to ruin system availability won't happen at big chance. By reading 'erasure coding paper', you can find that in 12 data-fragment case, a enough durability is achieved where 1/3 unavi situation can be solved. 

    Q: How 'Delete stream' works?

    Q: Would Append-only affect service Azure can support?

    A: Take 'block blob' as an example, you can create, insert and delete a block, which compose 'block blob'. When you do this, you accually create, delete a 'stream'. With max size of 100MB , you can manage your 'block blob' elasticlly.

    Q: How 'page blob' is implemented?

* Ref

    [WAS paper,](https://www.sigops.org/sosp/sosp11/current/2011-Cascais/11-calder-online.pdf)
    [erasure coding paper,](https://www.usenix.org/system/files/conference/atc12/atc12-final181_0.pdf)
    [erasure code youtube,](https://www.youtube.com/watch?v=ExVw_Qc2-Qo)


### AliPangu

* Overview

    1. Client -> Master -> ChunkServer
        1. 需要发起一次写入的时候，Client向Master创建一个文件，并且打开这个文件，此时Master会选好三个副本的位置反馈给Client。Client根据三个副本的位置找到ChunkServer，把数据写进去。
* Ref 

    [blog](https://yq.aliyun.com/articles/64374)


### File System Design In Linux

See mind_recalling.md -> OperationSystem -> File System


## Trouble in Real World

## Unordered topic

* shadowPaging vs WriteAheadLog

https://en.wikipedia.org/wiki/Shadow_paging

* GFS: Evolution on Fast-Forward  [ref](https://wiki.ubc.ca/images/0/04/NewGFS.pdf)

* Write amplification

* 曹雪林：Raft 在实现过程中，还遇到过 “快盘饿死慢盘”的问题，大家业余时间可以想一下为什么会有这个问题，缓解的方法是什么

* Polar FS: ParallelRaft

https://www.zhihu.com/question/278984902

look behind buffer

* Aurora： 
  将数据库存储引擎做到块存储里，可以看到，它的设计里，数据是落日志即返回成功的

* RAFT refine :
http://mysql.taobao.org/monthly/2019/03/08/
小文章： Raft phd 论文中的pipeline 优化

* 4KB , disks are arranged in fixed-size blocks, why?

* cache tiering 
    https://docs.ceph.com/docs/master/rados/operations/cache-tiering/

* https://www.cockroachlabs.com/blog/scaling-raft/     cockroach DB 的一个小文章

* HDFSErasureCodingDesign-20150206

* 傲腾内存原理： 

https://en.wikipedia.org/wiki/3D_XPoint#cite_note-1

* Ucloud 基于SPDK 优化

https://mp.weixin.qq.com/s/1XwaD8GUSCf-nOk66yLr8w

* 京东云2019-12-10号遇到大量掉盘的问题 

现象：12月5日连续坏盘导致CFS bj04集群受影响5-6个小时，影响情况非常恶劣

问题原因：美光的5200 系列使用了Line cache的优化，但在某些IOPatern和频率的情况下有bug。

解决方案是：升级硬盘的嵌入式程序，disable 掉 Line cache

![分析和原因](https://photos.google.com/photo/AF1QipPzXQtuLMD8WTxTOzEWd3pB7RH_yM0yLD5a4OOL)

![分析和原因](https://photos.google.com/photo/AF1QipNGYLhQzqKmOfKdnyhPv65uFfXaDz1xn0UKxcWd)

* 分布式RPC， 三态

成功，失败, 超时

* 重新设计ZBS

[ref](../SmallTopic/designZbs.md)

* zbs-rg 太多的话，journal 空间就不好分配