# Regression on TSA

TODO: 完成笔记

一个大的正太分布可能是多个小的正态分布组合而成的

$$
    Y_t = f(X_t, t;\theta) - \epsilon_t
$$
- 
- 
- $\{\epsilon_t\}$ 均值为零，方差为 $\sigma_t^2 = \sigma^2 \Sigma_{ii}$ (白噪声的假设)

    $$ Cov[]

#### 对输入的变量的回归 $x_t \to y_t$

> 多元变量的回归

**LS-Estimate**:

$$
    \hat{\theta} = \argmin_\theta \sum_{t=1}^n \varepsilon^2_t(\theta)
$$



#### 对于时间的回归 $y_{t-1} \to y_t$

> EMA, 指数平均

## 未知自变量 $x$ 的回归

只有观察 $\{y_t\}$ 的序列

#### 模型

- 常数均值： $\bm{Y=1\mu} + \epsilon$

  可以直接利用 **OSE** 的方法估计 $\mu$
  TODO: 推理