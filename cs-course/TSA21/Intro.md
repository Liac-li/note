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