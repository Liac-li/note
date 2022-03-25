# AI intro

## content

#### Part 1

##### Agent

- Reflex agent: 
    - act base on sensors, 
    - no memory, no env-model
- Reflex agent with state: 
    - store history of observed env
    - rule driven
- goal-based agent
    -  no manual rules
- utility-based agent
- learning agent
    - learning element + performance element + problem generation

##### Uninformed Search Algorithm

- DFS; BFS; cost first Search
    - Tree search & graph search (with `closed_set` for circle in graph)
- limited depth DFS

TODO: optimization; space & time cost
    
##### Informed search

Introduce priori information to speed up searching
- $g(n)$: known cost; $h(n)$ unknown cost(future)
- Heuristic search: => greedy search
    Expend node only base on the heuristic value
    - Complete: yes
    - Time: $O(b^m)$
    - Space: $O(b^m)$
    - Not optimal

**A\* optimization**

Expand node with path cost ( $g(n) + h(n)$ ) 

- Use **admissible** heuristic: => optimal
    - $h(n) \le h^*(n)$, for $h^*(n)$ is the true cost of node n
    - $h(n) \ge 0$, and $h(goal) = 0$

    > Proof:
    > if path p searched from A* search is not optimal, thus there must exists another path p1 is optimal, let node x is the first different among the path nodes of each path, let x*, x1* is the next node
    > thus must be $g(x*) + h(x*) \ge g(x1*) + h(x1*)$, and there will exist another node j on both path, 
    > and we set p is optimal path, thus every node on it has the smallest cost at each searching step, and the target function $g(n) + h(n)$ is non-decreasing, which implies that p1 is sub-optimal
    >>  - optimal path always has cost less than on the sub-optimal
    >> - $f = g + h$ value of the goal state on the optimal is small then the true cost, and small than any sub-optimal $$f(n) = g(n) + h(n) \ge g(n) + h^*(n) = g(G_1) \ge g(G_2)$$, in priority queue, node on optimal path will be selected before any other nodes on sub-optimal path
    >> - only chose the node with smallest cost till selecting the node to *expand*

- How to design heuristic function
    - 8-puzzle: $h_1$ number of misplaced tiles; $h_2$ total Manhattan distance 
    - expanding fewer nodes is good; as close to truth as possible
    - use $\max \{h_1, h_2\}$ to jel many heuristic function
    
    - relaxed version: problem violate the constraints of the original question (remove parts of constraints) 

**Graph search**
    
#### Multi-agent search
    
Adversarial Search

we consider two player -> Min Max, zero-sum games
- two type:
    - deterministic v.s. chance
    - perfect v.s. partially observable information

- alpha-beta pruning
- search order is important
- heuristic function: how to decision
- search with random node

##### Bandits & MCTS

- epsilon-greedy; upper-confidence bound;
 
##### General space search

##### constraint satisfaction search

#### Knowledge

##### Bayesian

##### approx mc inference

#### Learning

##### PAC

> 二范数 -> 稠密， 最大值小; 一范数 -> 稀疏

