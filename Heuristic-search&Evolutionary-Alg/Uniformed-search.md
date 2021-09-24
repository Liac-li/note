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

## Heuristic Function

#### 提升 $H(n)$ 的效果

**Goodness of $H(n)$**

If $h_1(n)$ use **less cost** to find the optimal final state than $h_2(n)$, then it is batter

Therefore, we need run the programer with all of heuristic functions to measure their goodness.

**Combined $H(s)$**



## Math

- $\sqrt{2\pi n}(\frac{n}{e})^n \rightarrow_{n\to \infty} n!$


