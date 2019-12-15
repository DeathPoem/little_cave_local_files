# Reading Note For "Designing Data Intensive Application"

https://www.amazon.com/Designing-Data-Intensive-Applications-Reliable-Maintainable-ebook/dp/B06XPJML5D

## Mind Mapping

## Concept Gallery

1. Design aspect
2. Tech, solution aspect

## Part 1. Foundations of Data Systems

### CHAPTER 1 Reliable, Scalable, and Maintainable Applications

exploring the fundamentals of what we are trying to achieve: reliable, scalable, and maintainable data systems.

#### Reliability
tolerate or prevent fault to not stop service

1. Hardware Faults:  
redundancy of hardware

3. Software Errors:  
Lots of small things can help

4. Human Errors:  
configuration errors by operators were the leading cause of outages

#### Scalability
Even if a system is working reliably today, that doesn’t mean it will necessarily work reliably in the future. 

1. Describing Load: 

2. Describing Performance:

3. Approaches for coping with load:  
An architecture that scales well for a particular application is built around assumptions of which operations will be common and which will be rare—the load parameters.

#### Maintainability
majority of the cost of software is not in its initial development, but in its ongoing maintenance

1. Operability:  
Making Life Easy for Operations:

3. Simplicity:  
Managing Complexity: A good abstraction can hide a great deal of implementation detail behind a clean, simple-to-understand façade.

4. Evolvability:  
Making Change Easy: 

### CHAPTER 2 Data Models and Query Languages

each layer hides the complexity of the layers below it by providing a clean data model. allow different groups of people to work together effectively.

In this chapter we will look at a range of general-purpose data models for data storage and querying

One model can be emulated in terms of another model —for example, graph data can be represented in a relational database—but the result is often awkward. 
That’s why we have different systems for different purposes, not a single one-size-fits-all solution.

#### Relational Model Versus Document Model

1. The Birth of NoSQL:  
There are several driving forces behind the adoption of NoSQL databases

3. The Object-Relational Mismatch:  
development today is done in object-oriented, so , an awkward translation layer is required between the objects in the application code and the database model of tables

3. Many-to-One and Many-to-Many Relationships:  
In relational databases, it’s normal to refer to rows in other tables by ID

4. Are Document Databases Repeating History?:  
The history of relational databases.
Document databases reverted back to the hierarchical model in one aspect: storing
nested records (one-to-many relationships, like positions , education , and
contact_info in Figure 2-1) within their parent record rather than in a separate
table.

5. Relational Versus Document Databases Today:  
(1) concentrate only on the differences in the data model.
(2) If the data in your application has a document-like structure, then it’s probably a good idea to use a document model.
(3) Schema flexibility in the document model.
(4) Data locality for queries.
(5) Convergence of document and relational databases. A hybrid of the relational and document models is a good route for databases to take in the future.

#### Query Languages for Data

A declarative query language is attractive because it is typically more concise and eas‐
ier to work with than an imperative API.  it also hides implementation details of the database engine.

1. Declarative Queries on the Web  
In a web browser, using declarative CSS styling is much better than manipulating
styles imperatively in JavaScript. Similarly, in databases, declarative query languages
like SQL turned out to be much better than imperative query APIs. 

2. MapReduce Querying  
(1) MongoDB’s MapReduce feature
(2) The moral of the story is that a NoSQL system may find itself accidentally reinventing SQL, albeit in disguise.

#### Graph-Like Data Models

The relational model can handle simple cases of many-to-many relationships, but as the connections 
within your data become more complex, it becomes more natural to start modeling your data as a graph.

1. Property Graphs

2. The Cypher Query Language

3. Graph Queries in SQL

4. Triple-Stores and SPARQL

5. The Foundation: Datalog

### CHAPTER 3 Storage and Retrieval

In this chapter we discuss the same from the database’s point of view: how we can store the data that we’re given, and how we can find it again when we’re asked for it.

#### Data Structures That Power Your Database

In order to efficiently find the value for a particular key in the database, we need a different data structure: an index. 

Any kind of index usually slows down writes, because the index also needs to be updated every time data is written.

1. Hash Indexes  
(1) Design an append-only kv store. 
(2) But an append-only design turns out to be good for several reasons. (2.1) Appending and segment merging are sequential write operations, which are generally much faster than random writes. (2.2) Concurrency and crash recovery are much simpler if segment files are append-only or immutable.

2. SSTables and LSM-Trees  
(1) Re-Design that append-only kv store with SSTables.
(2) Constructing and maintaining SSTables.
(2.1) a write comes in, add it to an in-memory balanced tree data structure, called a memtable
(2.2) write it out to disk as an SSTable file, when memtable gets big
(2.3) a read request, first try to find the key in the memtable, then in the most recent on-disk segment
(2.4) merging and compaction process in the background
(3) Making an LSM-tree out of SSTables.
(4) Performance optimizations
(5) Summary:LSM-trees is simple and effective. Since data is stored in sorted order, you can efficiently perform range queries (scanning all keys above some minimum and up to some maximum), and because the disk writes are sequential the LSM-tree can support remarkably high write throughput.

3. B-Trees  
(1) break the database down into fixed-size blocks or
pages, allows one page to refer to another
(2) Making B-trees reliable, 
(2.1) a write-ahead log (WAL, also known as a redo log)
(2.2) careful concurrency control is required
(3) B-tree optimizations

4. Comparing B-Trees and LSM-Trees  
(1) As a rule of thumb, LSM-trees are typically faster for writes, whereas B-trees are thought to be faster for reads. Reads are typically slower on LSM-trees.
(2) Advantages of LSM-trees
(2.1) one write to the database resulting in multiple
writes to the disk over the course of the database’s lifetime—is known as write amplification
(2.2) LSM-trees can be compressed better, and thus often produce smaller files on disk than B-trees.
(3) Downsides of LSM-trees
(3.1) A downside of log-structured storage is that the compaction process can sometimes interfere with the performance of ongoing reads and writes.
(3.2)  the bigger the database gets, the more disk bandwidth is required for compaction

5. Other Indexing Structures
(1) secondary indexes can be made by hack LSM-tree or B-tree
(2) Storing values within the index
(2.1) A compromise between a clustered index (storing all row data within the index) and a nonclustered index (storing only references to the data within the index) is known as a covering index or index with included columns
(3) Multi-column indexes
(3.1) assume a two-dimensional range query like the following: ```SELECT * FROM restaurants WHERE latitude > 51.4946 AND latitude < 51.5079 AND longitude > -0.1162 AND longitude < -0.1004;``` A standard B-tree or LSM-tree index is not able to answer that kind of query efficiently. R-trees are used.
(4) Full-text search and fuzzy indexes
(5) Keeping everything in memory. As RAM becomes cheaper, the cost-per-gigabyte argument is eroded. Many datasets
are simply not that big, so it’s quite feasible to keep them entirely in memory, poten‐tially distributed across several machines. 

#### Transaction Processing or Analytics?

online transaction processing VS online analytic processing

1. Data Warehousing
(1) The data warehouse contains a read-only copy of the data in all the various OLTP systems in the company
(2) This process of getting data into the warehouse is known as Extract–Transform–Load (ETL)
(3) A big advantage of using a separate data warehouse, rather than querying OLTP sys‐ tems directly for analytics, is that the data warehouse can be optimized for analytic access patterns.

2. The divergence between OLTP databases and data warehouses
(1) Many database vendors now focus on supporting either transaction processing or analytics workloads, but not both.
(2) a plethora of open source SQL-on-Hadoop projects, include Apche Hive

3. Stars and Snowflakes: Schemas for Analytics  

#### Column-Oriented Storage
If you have trillions of rows and petabytes of data in your fact tables, storing and querying them efficiently becomes a challenging problem. 
The idea behind column-oriented storage is simple: don’t store all the values from one row together, but store all the values from each column together instead.to minimize the amount of data
that the query needs to read from disk

1. Column Compression
(1) Memory bandwidth and vectorized processing
(1.1) column- oriented storage layouts reducing the volume of data that needs to be loaded from disk
(1.2) column- oriented storage layouts are also good for making efficient use of CPU cycles.
(1.3)  vectorized processing 

2. Sort Order in Column Storage
(1) if queries often target date ranges, such as the last month, it might make sense to make date_key the first sort key.
(2) For example, if date_key is the first sort key in Figure 3-10, it might make sense for product_sk to be the second sort key so that all sales for the same product on the same day are grouped together in storage. 
(3) Several different sort orders

3. Writing to Column-Oriented Storage
(1)  Column-Oriented Storage have the downside of making writes more difficult.

4. Aggregation: Data Cubes and Materialized Views
(1) Another aspect of data warehouses that is worth mentioning briefly is materialized aggregates. materialized view. creating cache for the same aggregates are used by many different queries.

### Chapter 4. Encoding and Evolution

rolling upgrade, This means that old and new versions of the code, and old and new data formats,
may potentially all coexist in the system at the same time.

Backward compatibility, Forward compatibility

#### Formats for Encoding Data

encoding marshalling & decoing unmarshalling

1. Language-Specific Formats

2. JSON, XML, and Binary Variants

3. Thrift and Protocol Buffers

4. Avro

5. The Merits of Schemas

#### Modes of Dataflow

1. Dataflow Through Databases

2. Dataflow Through Services: REST and RPC
(1) Web services
(2) The problems with remote procedure calls. there’s no point trying to make a remote service look
too much like a local object in your programming language, because it’s a fundamen‐
tally different thing
(3) Current directions for RPC
(4) Data encoding and evolution for RPC

3. Message-Passing Dataflow
(1) Message brokers
(2) Distributed actor frameworks

## PART II Distributed Data

(1) Scaling to Higher Load
(2) Shared-Nothing Architectures
(3) Replication Versus Partitioning/sharding

### CHAPTER 5 Replication

"single-leader, multi-leader, and leaderless replication"

"eventual consistency"

"read-your-writes and monotonic reads guarantees"

#### Leaders and Followers

Leader write, follower read only

1. Synchronous Versus Asynchronous Replication

"semi-synchronous"

2. Setting Up New Followers

3. Handling Node Outages

(1) Follower failure: Catch-up recovery
(2) Leader failure: Failover
(2.1) Determining that the leader has failed.
(2.2) Choosing a new leader.
(2.3) Reconfiguring the system to use the new leader.
(2.4) things that can go wrong, data recovery, split brain, leader timeout

4. Implementation of Replication Logs

(1) Statement-based replication

(2) Write-ahead log (WAL) shipping

(3) Logical (row-based) log replication

(4) Trigger-based replication

#### Problems with Replication Lag

tolerate node failures is just one reason for wanting replication. 
other reasons are scalability (processing more requests than a single machine can handle) and 
latency (placing replicas geographically closer to users)

*eventual consistency*
*replication lag*

1. Reading Your Own Writes