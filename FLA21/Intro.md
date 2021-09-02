# 形式语言自动机

## 课程组成

1. Preliminaries 
2. 
3. Modeling
4. Tutorials

**TextBook**: Introduction to Automata Theory, Languages, and Computation 3/E
**Referred Reading**: 
- Introduction to the theory of Computation

**Grading**: 30% assignment, 20% project, 50% final exam

## Preliminaries

Set, Functions, Relations Graphs, Proof Techniques

#### Set

$A = \{1,2\}$

- Set Cardinality: $A=\{1, 2\}, |A| = 2$
- Power Set: Set of all subset of S. $P(A) = 2^{A} = \{\emptyset, \{1\}, \{2\}, \{1, 2\}\}$, Observation: $|2^{S}| = 2^{|S|}$
- Cartesian Product: $A \times B$

#### Function

$f: A\rightarrow B$: associates with each $a$ in $A$ at most one element $b$ of $B$

- $f$ is bijection
  - f is total
  - for all $a$ and $a'$ in A, $a \neq a'$ implies $f(a) \neq f(a')$

- $O, \Theta, \Omega$ notions, the rate of growth

#### Relations

Relation $R$ is any subset of $A\times B$, In other words, $R \subseteq A\times B$

- Equivalence relations:
  - reflexive
  - symmetric
  - transitive

- Equivalence class
    - if R is eq
- Partial order:
    - reflexive
    - transitive
    - antisymmetric 
- Total order: (linear order) partial order on all item in $A\times B$

#### Graph

- Walk: a sequence of adjacent edge
- Path: a walk where on edge is repeated
    - simple path: path where is no node repeated
- Cycle: walk from a node to itself
    - simple cycle: only repeat the base node

- Reachable:
- Tree

#### Proof Techniques

proof by induction, proof by contradiction

- Pigeon Hole principle

## Languages

**Define**: language is a set of strings (string: a sequence of letters/symbols)

- Empty string: string consist of no letters in alphabet
- Substring: s is substring of x if there exist strings y and z such that x = xyz(y,z may be empty string)
- Prefix & Suffix: **can be** empty string
- Power: $w^n = w\dots w$, $w^0 = \lambda$
- $^*$ operation: $\Sigma^{*}$ the set of all possible strings from alphabet $\Sigma$, must be infinite set
- $\Sigma^{+}$: the set of all possible strings from alphabet $\Sigma$ except $\lambda$, $\Sigma^{*} - \{\lambda\} = \Sigma^{+}$

Note:
- $\emptyset = \{\} \neq \{\lambda\}$
- $|\{\}| = |\emptyset| = 0$
- $|\{\lambda\}| = 1$


- Cartesian product: $L_1L_2 = \{ab, \forall a \in L_1, b\in L_2\}$
    - $L = \{a^nb^n: n\ge 0\}$, $L^2 = \{a^nb^na^mb^m: n,m\ge 0\}$
    - $L^0 = \{\lambda\}$
- Star-closure(Kleene *): $L^* = L^1 \cup L^2\dots$
    - $L^{+} = L^{*} - \{\lambda\}$