# Distributed System

Crouse web [mit-6.842](https://pdos.csail.mit.edu/6.824/)

**Define**: multiple computer with network connected cooperate to handel a task

#### Why Distributed system

1. Connect physically separated machines, sharing between users(data, screen,...)
2. Increasing capacity though parallelism
3. Tolerate faults
4. Achieve security, via isolate

#### History context

- local area networks(1980s) - AFS, DNS + email
- Data-centers, big websites (1990s), we need web search, a lot of data and users
- Cloud computing 
- Correct state: active researchers

#### Challengers

- many concurrent parts
- must be deal with partial failure

two things drive the complexity

- tricky to realise the performance benefit
    gain of performance no linear to the cost

#### mit-6.824

- Interesting: hard problems but powerful solutions
- Used in real world
- Active area of research
- Skill of programming upon parallelism

#### Course structure

lecture driven by papers, case study (read papers before class)

Labs:

1. map reduce
2. replication using Raft
3. Replicated K/V servers 
4. shaded K/V servers
5. (Optional) achieve a paper

##### Focus

- Storage
- Computation
- Communication

making **Abstriction**

##### Main topic

- Fault tolerance
    1. availability: separate the faults (local crash)
    2. recoverability: logging, curable storage
- Consistency
- Performance
    1. through put
    2. latency

## Map Reduce

good illustration and very influential

Approach
- Map&Reduce: sequential code
- MR deals with distribution 

#### Abstract view

- Branch of input files: f1, f2, f3
- Map function: f1 to <word, value> 
- Reduce function: merge/combine the key/value pair to final result


## RPC (Remote procedure call)

Goal: acting PAC as PC

**RPC semantics under failure**

- at-least-once: client retry and keep going (net error, ... )
- at-most-once: duplicate
- exactly-once: hard to arrange


