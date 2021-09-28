# Regression on TSA

一个大的正太分布可能是多个小的正态分布组合而成的

> 最优线性预测: $\hat{Y}_2 = \rho\dfrac{\sigma_2}{\sigma_1}Y_1$

$$
    Y_t = f(X_t, t;\theta) - \epsilon_t
$$

- $X$ 为**独立**的变量
- $\theta$ 为$m$ 个参数
- $\{\epsilon_t\}$ 均值为零，方差为 $\sigma_t^2 = \sigma^2 \Sigma_{ii}$ (白噪声的假设)

    $$ 
      Cov[\varepsilon_{ti}, \varepsilon_{tj}] = \sigma^2 \Sigma_{ij}
    $$

#### 对输入的变量的回归 $x_t \to y_t$

线性模型假设:
  $$
    Y_t = \bm{x_t}^\top \bm{\theta} + \varepsilon_t
  $$

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