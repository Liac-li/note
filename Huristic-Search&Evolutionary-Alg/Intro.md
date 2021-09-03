# 启发式搜索与演化算法

## 简介

[课程网站](http://www.lamda.nju.edu.cn/HSEA21/)

答疑 Fri 14:00 ~ 16:00 逸夫楼A-502

40%  Final Exam， 60% Assignment(each 15%) 

- Outline
  1. Traditional heuristic search algorithms
  2. Evolutionary algorithm
  3. Theoretical analysis fo evolutionary algorithm
  3. Design of evolutionary algorithm 

## Search

Search Problem can be defined formally by five components:
  1. Initial state
  2. Actions
  3. Transition model
  4. Goal test
  5. Path cost 

Optimization problem $\Leftrightarrow$ Decision Problem

## Uninformed Search

#### BFS

- Property
  - Complete: if depth $d$ of the goal node is finite
  - Optimal: all actions have the same cost
  - Time Complexity: $O(b^d)$, where $b$ correspond to branching factor, $d$ for depth. Or $O(b^{d+1})$ if check the goal when expend set
  - Space Complexity: $O(b^d)$

#### Uniform-cost search

Main idea: expand the node $n$ with the lowest cost $g(n)$

## Math

- $\sqrt{2\pi n}(\frac{n}{e})^n \rightarrow_{n\to \infty} n!$


