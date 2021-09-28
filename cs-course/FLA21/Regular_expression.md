# Regular Expression

> Definitions
> Equivalence to Finite Automata

Regular expression(RE) describe language by and algebra.

If $E$ is a RE, then $L(E)$ is the language it defines

RE's use three operations: 
1. union
2. concatenation: $LM$ concatenation of L, M, like Cartesian product
3. Kleene star

#### Definition

**Basis**
1. if $a$ is any symbol, then $a$ is a RE, and $L(a) = \{a\}$
2. $\epsilon$ is RE, $L(\epsilon) = \{\epsilon\}$ 
3. $\emptyset$ is RE, $L(\emptyset) = \emptyset$

**Induction**
1. $E_1 + E_2$ is RE, $L(E_1 + E_2) = L(E_1) \cup L(E_2)$
2. $E_1E_2$ is RE, $L(E_1E_2) = L(E_1)L(E_2)$
3. $E^*$ is RE, $L(E^*) = (L(E))^*$

Precedence of Operator: $^* > concatenation > +$

#### Equivalence of RE and DFA

##### RE $\to$ $\epsilon$-NFA

Induction construct

1. we use two new state to let a part of RE has **no arcs from outside**(Note for $\empty$: just no arc between two states)
2. Operator Induction
    - Union: two new states with $\epsilon$ as action
    - Concatenation: two part connect with $\epsilon$ 
    - Closure($^*$): $\epsilon$ loop from tail to head, but with another $\epsilon$ from head to tail (zero or more)

##### DFA $\to$ RE

Main idea: 
1. Name the state of DFA and $1, 2, \dots, n$
2. We induct on $k$, the num of state allowed to traverse along a path ($k$-path)
> We always has to find a critical to induct

**$k$-path**

$k$-path is path goes through no state numbered higher than $k$

- Endpoints ars **no restricted**, can be any state
- n-paths ar unrestricted

**Target**: RE is the union of RE's for the n-paths from the start state to **each** final state

**Induction**
1. Basis: $k=1, R_{ij}^0 = $ sum of the arc from i to j
    - $\empty$ if no such arc
    - But add $\epsilon$ if $i=j$
2. $k$-path from $i$ to $j$ either
    - Never goes through state $k$ or,
    - Goes through $k$ one or more times

  $$
    R_{ij}^k = R_{ij}^{k-1} + R_{ij}^{k-1}(R_{kk}^{k-1})^*R_{kj}^{k-1}
  $$

#### Algebraic laws for RE's

- $+$ is commutative and associative; concatenation is associative
- Concatenation distributes over $+$

- $\empty$ is identity for $+$
- $\empty$ is annihilator for concatenation
- $\epsilon$ is identity for concatenation

TODO: Decision property of RE