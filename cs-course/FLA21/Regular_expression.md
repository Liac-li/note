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

#### Decision Properties of Regular Languages

> we use DFA to construct our proof of RE property

Problems:
- Is the language is finite? (DFA $\to$ finite/terminate)
- Is the language nonempty? (make the final state 'error' state)
- Is the smallest DFA?
  - the same language?

- Membership Problem:
  > is sting $w$ in RE $L$

  simulate the DFA $A$ of $L$ on the sequence of input symbols forming $w$

  DFA is more simply than NFA

- The Emptiness Problem:
  Check the reachable states set from start state(DFS)
- Infinite Problem:(If cycle, string will be infinite) 
  **Key idea**: if the DFA has $n$ state, and the language contains any string of length $n$ or more, then the language is infinite
  > PHP, cycle in DFA $\{0^n1^n\}$
  
  > but above may not terminated

  **Second key idea**: if there is a string of length $\ge n$(= the number of DFA), than there must be a string of length between $n$ and $2n-1$ (we can shorten all string length over $2n$ to $[n, 2n-1]$)
  > will terminated, but very slow

  **Finding Cycles**:
    1. eliminate all state not reachable from the start state, and the state do not reach the final state
    2. test if exist cycle in the remain transition graph

    Alg to find cycles (just simple DFS with visited points)

- Equivalence: $L = M$? 
  we do RE production $L\times M = [q, r], q\in L, r\in M$
  - Start state: $[q_0, r_0]$ start state of $L, M$
  - Transition: $\delta([q,r], a) = [\delta_L(q, a),  \delta_M(r, a)]$
  - Final state: $[q, r]$ one of the $q$ or $r$ is the final state of $L, M$, (which meaning if the production DFA accept a sting $w$, than $L, M$ not equiv)

  $L = M$ if and only if the product automaton's language is empty
- Containment: also the production $L \subseteq M$
  - Final $[q, r]$ for $q$ in final set of $L$, but $r$ not

> Different problem, define different final state product automaton

- Minimum-State DFA of a RE:
  given a DFA find the DFA with the fewest state accepting $L(A)$

  Distinguish: if a string $w$ from $a, b$ but only one DFA accept $w$, than the $w$ distinguish $a, b$

  - Basis: mark pairs whit exactly one final state
  - Induction: mark $[q, r]$ if for some input symbol $a$, $[\delta(q,a), \delta(r,a)]$ is marked(feed back)

  Transitionary of indistinguishable state: $a, b$ and $b, c$ are indistinguishable, then $a, c$ are indistinguishable

  And After combining indistinguishable state, it the optimal minium DFA.

##### Pumping Lemma

For every RE $L$, there is an integer $n$(number of states of DFA for $L$), such that
for every string $w$ in $L$ of length $\ge n$,
we can write $w = xyz$ such that:
1. $|xy| \le n$
2. $|y| > 0$ ( not $\epsilon$ )
3. $\forall i\ge 0, xy^iz$ is in $L$ ( $y$ is a cycle )

Pumping Lemma **To proof a language is DFA**

#### Closure Properties of Regular Languages

After some operating is a RE still regular?

- Closure under union: $R, S$ is the regular expression of $L, M$, then the $R+S$ is teh regular expression of $L \cup M$
- Kleene, concatenation is closure (same idea)
- Closure under intersection: $L \cap M$
  Do product automaton
  - Final state: $[q, r]$ both final state in $L, M$
- Closure under difference: $L - M$
  Product automaton: $[q, r]$, $q$ is final of $L$, but $r$ not
- Closure under Complementation: $\Sigma^* - L$
- Closure under Reversal: