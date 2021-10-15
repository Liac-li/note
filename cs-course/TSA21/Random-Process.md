# 时间序列的随机过程视角

随机过程来了看的TS，$x_1, x_2,\dots x_t$ 可以看作是从 $X_1, X_2, \dots X_t$ 的一系列的 $t$ 个随机变量中的取样

TODO: RP & TS table

难点：每个时刻只有**一次**观察值( $X(\cdot, \omega) $)

处理过程:
1. given $x_1, x_2, \dots, x_n$
2. 给出模型/系统(加入人为的一些假设)
3. 估计 $\{X_t\}$ 的性质(随机过程，参数估计)
4. 分析/预测

时间序列的遍历性: Ensemble average & Time average 是一致的

#### 一些特殊的随机过程

- Normal Process
- Markov Process
- Deterministic Process
- Pure stochastic process: (White Noise)

**White Noise**: 
- $E[X_t] = 0$ 
- $V[X_t] = \sigma^2$
- TODO
- TODO

满足 Strong Stable Assumption
1. 相互无关
2. 在频域/谱上是一个常数

> i.i.d Noise: $\varepsilon_t \sim N(0, \sigma^2)$

#### 评价RP的指标

- 自协方差函数(Autocovariance function)
  - 有对称性
  - 规范性 $|\gamma(k)| \le \gamma(0)$
  - 非负定性 $\forall z, n, t,\quad \sum_{i=1}^n\sum_{j=1}^nz_iz_j\gamma(t_i-t_j) \ge 0$
  - 连续性 $\gamma_(k)$ 于 $k=0$ 处连续 $\Rightarrow \gamma(k), \forall k$ 连续
- 自相关函数(Autocorrelation function)

TODO: Note