# Chap14 概率图模型

如果你的assumption是对的，则对于数据的需求会比较的少
> 在 Learning, Inference 上都与图算法相结合(有向图，无向图)

??? How to do inference in Probability graph model

## HMM

> 感觉上 HMM 即就是一种简单的 bayesian model, 观测变量是由内部的变量而生成的

#### MRF(Markov Random Field)

著名的**无向图**模型

- Clique: 点集中的任意两个点之间都有边相连
    - 极大团：不能加入任意一个点的团

我们定义一个情况下的$\bm{X}$ 的出现概率为：(基于clique的soft-max组合)

$$
    P(\bm{X}) = \frac{\prod_{Q\in C} \psi_Q(\bm{x}_Q)}{\sum_{\bm{X}}{\prod_{Q\in C} \psi_Q(\bm{x}_Q)}}
$$

- Global Markov property: 给定两个变量集合的*分离集*， 则其条件独立

> Conditional Independence: $A, B$ are said conditionally independent given $C$($A\perp B|C$), iff
> $P(A|B, C) = P(A|C)$ or $P(A,B|C) = P(A|C) P(B|C)$

$$
    \begin{align*}
        \psi_Q(x_q) &\dot = \exp(-H_Q(x_Q)) \\
        H_Q(x_Q) &\dot = \sum_{u,v\in Q, u\neq v} \alpha_{uv}x_ux_v + \sum_{v\in Q} \beta_v x_v
    \end{align*}
$$

#### 条件随机场(Conditional Random Field, CRF)

> 判别式模型-对条件分布进行建模

对于 label 的相关关系进行建模

要求其label具有马尔可夫性，故而可以简化一些条件函数

Feature Functions: 人工专家对于问题的先验规则

此后基于 chain-structured CRF

$$
    P(\bm{y}|\bm{x}) = \frac{1}{Z}\exp\left(\sum_{j}\sum_{i=1}\lambda_j t_j(y_{i+1}, y_{i}, \bm{x}, i) + \sum_k\sum_{i=1}^n \mu_k s_k(y_i, \bm{x}, i)\right)
$$

- $t()$ - transition feature function
- $s()$ - status feature function

> 注意，此处建模明显的是一个对于含序的数据的建模，其隐变量明显的含有序列，但是感觉上*随着特征函数的随意定义，其效果会有很大的不*

> 同时可以看到， CRF 和 MRF 的函数定义的形式高度的相似，但是CRF对于 $P(y|x)$ 建模， MRF 对于 $P(x, y)$ 建模

## Inference

1. Marginal Distribution: integrate all parameters except $x$ we interest
2. Parameters of distribution: maximize likelihood or maximize posterior probability

$$
    P(x_a | x_b) = \frac{P(x_a, x_b)}{P(x_b)} = \frac{P(x_a, x_b)}{\sum_{x_a} P(x_a, x_b)}
$$

we can get $P(x_a, x_b)$ from HMM model used, so the key of inference is to get marginal distribution of $P(x_b)$

#### 变量消去法

利用 Global Markov Property 来直接简化 $P(x_n) = \sum P(x_{1;n-1}x_n)$， 然后可以看到不同的的边际分布依赖于其他的边际分布，类似与一个DP问题

> 注意此方法仅仅单纯的依赖于Global Markov Property，故而对于有向图和无向图都可行

#### Belief Propagation(Sum-Product)

作为对于变量消去法计算不同的边际分布的重复计算的问题，Belief Propagation 是先计算所有的图上边的概率信息(Belief)的传播计算，然后储存下来

递推公式 $m_{ij}(x_j) = \sum_{x_i} \psi(x_i, x_j)\prod_{k\in n(i), j} m_{ki}(x_i)$

#### MCMC

> approx inference with sampling 

Problem: get teh transition matrix of markov chain
- Metropolis-Hastings(MH alg): sampling with rejection options
    Let transition rate as 
    $$
        Q(x^t|x^{t-1})A(x^t|x^{t+1})
    $$
    
    Q: Propose
    A: Accept Rate

> Sampling with rejections:
> Approx $p(x)$ which is complex with no equation, but can get the value with some $x$
> - use $q(y), y\sim N(\mu, \sigma^2)$ with probability greater than $p(x)$, with reject rate $\frac{p(x')}{q(x')}$ 

- Gibbs Sampling: (special case in MH)

#### 变分推断(Variational Inference)

> Intro: GMM with EM
> 吃了万里的看着锅里的，得寸进尺，一山更比一山高

TODO: 加入EM角度的优化部分和理解

**变分**:

因为EM中人为定义的分布 $q(\bm{z})$ 不好计算的，故而简化形式为
$$
    q(\bm{z}) = \prod_{i=1}^M q_i(z_)
$$

变分方法:(mean field)