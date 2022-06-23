# 概率论

- 常见的概率分布
    - Bernoulli, 二项分布， 几何分布，泊松分布， 高斯分布

- 分布的刻画: 期望，方差，全概率(期望，方差)

- 随机变量的组合:  $x \pm y, x \times y$ c.d.f. p.d.f, expectation, variance

- 统计部分: 参数估计，假设检验，置信界

- 数学部分: 几个不等式，集中不等式，大数定理

#### 分布：

- 二项分布:  $x \sim B(n, p), E[x] = np, Var[x] = np(1-p)$ 

- 几何分布: x 为重复伯努利试验到出现的次数: $p(x) = (1-p)^{x-1}p, E[x] = 1/p, Var[x] = \frac{1-p}{p^2}$

- Poisson Distribution: $Pr(X = k)=\frac{\lambda^k e^{-\lambda}}{k!}, E[x] = \lambda, Var[x] = \lambda$

- 指数分布: $Pr(X = k) = \lambda e^{-\lambda x}, E[x] = \lambda, Var[x] = \frac{1}{\lambda^2}$
    - 无记忆性的随机变量

- Uniform Distribution:  $P(x) = \frac{1}{b-a}, E[x] = \frac{a+b}{2}, Var[x] = \frac{(b-a)^2}{12}$

#### 随机变量的指标:

- 全期望 $E[X] = E_y[E_x[X|Y]]$

- 全方差 $Var[Y] = E[Var[X|Y]] + Var[E[Y|X]]$ [Proof](https://en.wikipedia.org/wiki/Law_of_total_variance)

- $Cov(x, y) = E[(x - \mu_x)(y - \mu_y)] = E[XY] - E[X]E[Y]$

#### 随机变量的组合:

c.d.f $F(X \leq x, Y \leq y)$ => $P(x, y) = \frac{\partial^2 F(x, y)}{\partial x\partial y}$

**边际化**: $F_x(x, y) = \lim_{y\to +\infty} F(x, y)$

- max(x, y), max * min

#### 大数定律

对于 $\{X_n\}$, \forall \epsilon > 0, s.t. \lim_{n\to \infty} P[|X_n - a| < \epsilon] = 1, or \lim_{n\to \infty} P[|X_n - a| > \epsilon] = 0$ 为依概率收敛到 a

**大数定律**:

$$
    \frac{1}{n}\sum_{i=1}^n x_i \to ^{p} \frac{1}{n} \sum_{i=1}^n E[x_i]
$$

1. Markov: 有 $Var(\sum_{i=1}^n x_i) / n^2 \to 0$, 则满足大数定律

2. Chebyshev: 有 $Var(X_i) < c$, 则满足大数定律

3. Khintchine: 有 $E[x_i]$ 存在， 则满足大数定理

3. Bernoulli: 有 $x_n \sim B(n, p)$, $X_n / n \to^p p$

** 中心极限 **

1. i.i.d $E[X_k] = \mu, Var[X_k] = \sigma^2$, $\sum_{k=1}^{n} X_k \to ^d N(n\mu, n\sigma^2)$

2. $X_n \to B(n, p)$, $X_n \to ^d N(np, np(1 - p))$

#### 集中不等式

> 刻画随机变量远离期望的可能

- Markov: $P(X \ge \epsilon) \leq \frac{E[x]}{\epsilon}$

- Chebyshev: $P(|X - \mu| > \epsilon) \leq \frac{Var(X)}{\epsilon^2}$

    $$
        P(X - \mu \geq epsilon) \leq \frac{\sigma^2}{\sigma^2 + \epsilon^2}
    $$


**Chernoff** 方法

$$
    P[x \leq -\epsilon] = P[tX \geq -t\epsilon] \leq e^{t\epsilon}E[e^{tx}]
$$

$$
    P[X\leq -\epsilon] \leq \min_t e^{t\epsilon}E[e^{tx}]
$$

Chernoff Bound: TODO

#### 统计



# 人工智能算法

- 搜索：定义，加速，DFS, BFS, 最优性质， heuristic searching, beam search ...

- 推理: ???

- 学习: RL(Q, V, bellman optimal equation), 

- 贝叶斯

# 数据结构

- List, Stack, Queue

- Disjoint set, heep

- Tree & Graph: binary tree, AVL, b-tree

# Algorithm

- Dynamic Programming: equations

- Ranking and searching

#### Tips:

- 前序和中序可以唯一的确定二叉树

