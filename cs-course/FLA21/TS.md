# Transition System

#### Equivalence

##### Strong isomorphic

> the transition systems are identical except for the names of the states

##### Weak isomorphic

strong isomorphic on reachable set(reach($T$)) of TS $T$

##### Bisimulation

> 计算机理论界的认为的最宽松的等价关系
>> 实际使用的时候还是比较强

$T$, $T'$ be two TS, and bisimulation between $T$ and $T'$ is a *binary* relation $B \subset S\times S'$, such that:
- $B(s_0, s'_0)$
- if $B(s_1, s'_1)$ and $s_1 \to s_2$, then there is a $s'_2 \in S'$ such that $s'_1 \to s'_2$ and $B(s_2, s'_2)$ (define on the successor)
- if $B(s_1, s'_1)$ and $s'_1 \to s'_2$, then there is a $s_2 \in S$ such that $s_1 \to S_2$ and $B(s_2, s'_2)$ 

> only consider the relation between successors of nodes, in other words, only the 'action' of TS 

> 1. 同层级对应 
> 2. 在同一层级make choice

> have the same behavior, and make choice at the same time

#### Free Product

