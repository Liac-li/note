# Chap14 概率图模型

如果你的assumption是对的，则对于数据的需求会比较的少
> 在 Learning, Inference 上都与图算法向结合

## HMM

> 感觉上 HMM 即就是一种简单的 bayesian model, 观测变量是由内部的变量而生成的

## MRF(Markov Random Field)

著名的**无向图**模型

## 条件随机场(Conditional Random Field, CRF)

> 判别式模型

对于 label 的相关关系进行建模

要求其label具有马尔可夫性，故而可以简化一些条件函数

Feature Functions: 人工专家对于问题的先验规则

## Inference

1. Marginal Distribution
2. Parameters of distribution

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