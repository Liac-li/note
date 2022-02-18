# Lec1: Intro

# Information:

60(15 + ...) + 40(Final exam)

**Stochastic Process**

##### Example 1: 

From node $0$ and travel to left or right with equal probability on given circle.

Problem: What's the probability of  last visited node until visiting all nodes?

**Solution**:

- Target $E_i, i$ is the last visited node until visiting all nodes.
- Random variable: $T_k$: the first time that the particle visits $k$

$$
    \begin{align*}
    P(E_i) &= P(E_i|T_{i-1} < T_{i+1})P(T_{i-1} < T_{i+1})\\
        &\quad +P(E_i | T_{i-1} > T_{i+1}) P(T_{i-1} > T_{i+1}) \\
        & = P(W_m)P(T_{i-1} < T_{i+1}) + P(W_m)P(T_{i-1} > P(T_{i+1})) \\
        &= P(W_m)
    \end{align*}
$$

With  $\sum_{i}^m P(E_i) = 1 \to m * p(W_m) = 1 \to P(W_m) = \frac{1}{m}$

> Event $W_m$: a gambler who starts with 1 unit, and wins 1 when a fair coin turns up head and lose 1 when it turns up tails, will have hia fortune go up by $m-1$ before he goes broke

##### Example 2:

Particle with visit its neighbors with equal probability. What's the probability of the first visited leaf is on the ray $i$?

**Solution**:

- Target: $E_i$: the first visited leaf is on ray $i$
- Event $C_k$, the first visited ray is $k$

$$
    \begin{align*}
        P(E_i) &= \sum_{k=1}^r P(E_i | C_k) \cdot \frac{1}{r}\\
    1. k \neq i \\
        P(E_i | C_i) &= P(W_{n_i}) \cdot 1 + (1 - P(W_{n_i})) \cdot P(E _i) \quad \text{Wn 是一个在上述定义过的赌徒问题}\\
            &= \frac{1}{n_i} + (1 - \frac{1}{n_i})P(E_i) \\
    2. k \neq i &\\
        P(E_i | C_k) &= P(W_{n_k}) \cdot 0 + (1 - P(W_{n_k})) P(E_i)
    \end{align*}
$$

$$
    r P(E_i) = \frac{1}{n_i} + \sum_{k=1}^r (1 - \frac{1}{n_k}) P(E_i)
$$

$$
    P(E_i) = \frac{1/n_1}{\sum_{k=1}^r 1/n_k}
$$

#### Properties of Stochastic Process

For a SP $\{X_t | t=1,2, \dots, k\}$

1. **Independent Increments**:
    
    if $\forall t_0 < t_1 < t_2 < \cdots < t_n$, the random variables
        $$
            X(t_0) - X(t-1), X(t_2) - X(t_1),\cdots, X(t_n) - X(t_{n-1})
        $$
    are independent, we say the SP has independent increment property
    
2. A SP is said to have **stationary increments** if $\forall s > 0$, 
    $$
        X(t+s) - X(t)
    $$
    has te same distribution for all $t$
    
    > The increment is independent with the start time

#### Stochastic Process in AI

- Markov decision process:
- Hidden Markov Model;
- Gaussian Process(GP) Bayesian Optimization 无梯度优化
- Evolutionary Algorithm