# Time Series Analysis

[课程网站](https://www.lamda.nju.edu.cn/yehj/timeseries2021/)

## 课程简述

- **目的** 分析序列的特性（分析潜在的影响因素）；对未来的序列进行预测和控制
- **描述** $x[t]$

## 时间序列表述

- Random Walk model: 我们定义与预测为 $\epsilon_t = P_t - \hat P_{t-1;t}$, 若有 $E[\epsilon] = 0$ 且 $Con(P_i, P_j) = 0$, 则 $P_t = \epsilon_t + \epsilon_{t-1}+ \cdots$ 其为一个不稳定的序列
- AR(1) (autoregressive first order): $P_t = \varphi P_{t-1} + \epsilon_t$
- 不同的时间指标， 考虑季节因素
    - 环比： 基于 $P_{t-1}$ 预测
    - 同比： 基于 $P_{t-12}$ 预测
  可以及进行合并得到 $P_t = \varphi P_{i-1} + \psi(P_{t-12} - \varphi P_{t-13}) + \epsilon_t$
> 可能考虑到不同的时间比例和最近的时间

- 几个基本问题
  1. 什么样的可以分析， 鉴别是否为纯随机序列（噪声类）
  2. 如何使得分析是可行的（可信的），观测样本丰富而模型简单
  3. 要分析分析什么，周期、趋势
- Moving Average: $y[n] = x[n] + b_kx[n-k]$, 对于n时刻的暑促仅仅和n时刻之前的输入相关的模型
- Auto Regressive: $y[n] = y[n-1] + a_iy[n-2] + x[n]$， n时刻输出仅和n时刻前输出相关的模型
- ARMA 

- 主要思路
    - 平稳：ARMA
    - 非平稳：差分处理

- 回归和时间序列：
    - 回归假设样本具有独立性
    - 时间序列分析利用数据相关性（惯性）分析预测 (也就是有依赖)

## 统计与时间序列分析

基本是历史部分了

- 时间差分的思想：一阶差分，二阶差分
    - 利用时间差分来去噪
    - Anderson 的差分方法，发展于**序列分解**和**识别平稳序列**

- 由外向内：确定性因素分解
- 由内向外：时域分析方法

##### 确定性因素分解

- 长期趋势 (secular Trends)
- 循环波动 (Cyclical fluctuations) 差分
- 季节性变化 (Seasonal variation) 搞点差分
- 随机波动 (Irregular variation) 通过统计

加法模型： $x_t = T_t+C_t+S_t+I_t$
乘法模型： $x_t = T_t\times C_T\dots$

指数平滑方法：滑动平均 (局部平均)

    - 滑动平均

##### 频率分析方法

- 傅立叶级数方法：无法处理随机因素
- Yule: 很多时间序列变量不是和时间相关，而是和同一序列中的滞后变量相关, AR 模型

    时间是具有惯性的，而不是简单的一个基于时间的函数

    Walker: AR(s)

    Eugen Slusky: MA

    Wold: ARMA, 平稳随机过程的定义

    Cramer 分解定义： 对于不平稳的序列

    George Box: ARIMA (Box-Jenkins) - 单变量、同方差的场

##### 异方差 (ARCH-Autoregressive conditional hetero-scedasticity)

因为在方差齐性的约束下，置信区间较小，不与实际符合

##### 多元时序

多元非平稳序列构建回归模型，会出现**伪回归**现象

## 数学基础

- n 维随机变量 $X = [X_1, X_2, \dots, X_n]^\top$
- 累计分布函数 $F(x_1, \dots, x_n) = P\{X_1 \le x_1, \dots, X_n \le x_n\}$
- 概率密度函数(连续):
    $$f(x_1, \dots, x_n) = \dfrac{\partial^n F(x_1, \dots, x_n)}{\partial x_1, \dots, \partial x_n}$$

    $$F(x_1, \dots, x_n) = \int_{-\infty}^{x_1}\dots\int_{-\infty}^{x_n}f(t_1, \dots, t_n)dt_1\dots dt_n$$
- 概率密度函数(离散)： $f(x_1,\dots, x_n) = P\{X_1=x_1, \dots, X_n=x_n\}$
- 期望: 多元 $E[\bm{X}] = [E[X_1], E[X_2],\dots, E_[X_n]]^\top$
- 矩：
    - n 阶矩： $E[X^n] = \int_{\infty}^{\infty}x^nf_{X}(x)dx$
    - n 阶中心矩： $E[(X - E[x])^n] = \int_{-\infty}^{\infty}(x -  E[X])^nf_{X}(x) dx$, 方差 $V[X]$ 为二阶中心矩
- 协方差：
    $$
        \begin{aligned}
            Cov(aX_1 + bX_2, cX_3 + dX_4) &=  acCov[X_1, X_3]\\ 
            &+ ad Cov[X_1, X_4]\\
            &+ bc Cov[X_2, X_3]\\
            &+ bd Cov[X_2, X_4]
        \end{aligned}
    $$
    

**多维度**

注意**协方差矩阵** $\bm{\Sigma_X} = V[\bm{X}] = E[(\bm{X-\mu})(\bm{X-\mu})^\top]$, 其中 $\bm{\Sigma}\succeq 0$ (通过一些相关系数的性质可得)

有 $\bm{X}\in \mathbb{R}^{p\times n}, \bm{Y}\in \mathbb{R}^{q\times n} $
$$
    \begin{align}
        \bm{\Sigma_{\bm{XY}}} &= C[\bm{X, Y}] \\
         &= E[(\bm{X-\mu})(\bm{Y-\nu})^\top]\\
         &= \begin{bmatrix}
                Cov[X_1, Y_1] & \cdots & Cov[X_1, Y_q]\\
                \vdots & \ddots & \vdots \\
                Cov[X_p, Y_1] & \cdots & Cov[X_p, Y_q]
            \end{bmatrix}
    \end{align}
$$

$$
    \begin{aligned}
       & \quad C[\bm{A(X + U)}, \bm{B(Y+V)}] \\
       &= \bm{A}C[\bm{X, Y}]\bm{B}^\top + \bm{A}C[\bm{X, V}]\bm{B}^\top\\
       & +\bm{A}C[\bm{U, Y}]\bm{B}^\top + \bm{A}C[\bm{U, V}]\bm{B}^\top 
    \end{aligned}
$$

且有 $V[\bm{AX}] = \bm{A}V[\bm{X}]\bm{A}^\top$

TODO: 
- [ ] 条件期望
- [ ] 方差分离
- [ ] 线性投影