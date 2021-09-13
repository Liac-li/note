# Uniformed-search

#### BFS

- Property
  - Complete: if depth $d$ of the goal node is finite
  - Optimal: all actions have the same cost
  - Time Complexity: $O(b^d)$, where $b$ correspond to branching factor, $d$ for depth. Or $O(b^{d+1})$ if check the goal when expend set
  - Space Complexity: $O(b^d)$



#### Uniform-cost search

Improve BFS performance when actions with different costs

Main idea: expand the node $n$ with the lowest cost $g(n)$

## Math

- $\sqrt{2\pi n}(\frac{n}{e})^n \rightarrow_{n\to \infty} n!$


