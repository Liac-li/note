# Expectation Maximizathion Algorithm

用于评估含有隐变量的参数模型的方式，基于最大似然估计或者最大后验

## 数学符号对应

- $\bm{Y}$: 观测变量列$(y_1, y_2, ...)$
- $\bm{Z}$: 隐变量列
- $\bm{\theta}$: 参数列
- 全数据(Complete data): $\bm{Y, Z}$
- 不完全数据(Incomplete data): $\bm{Y}$

## EM 算法步骤

**Input**: $\bm{Y,Z}$ $P(\bm{Y,Z}|\bm{\theta})$, $P(\bm{Z}|\bm{Y,\theta})$

**Output**: $\bm{\theta}$
1. 初始化参数$\bm{\theta}^{0}$
2. E步：记$i$次迭代数值，计算$i+1$次迭代的数值：
    $$
        Q(\theta, \theta^{i}) = E_{Z}[\log P(Y,Z|\theta)|Y,\theta^{i}]\\
        = \sum_{Z} \log P(Y, Z | \theta) P(Z|Y, \theta^{i})
    $$
3. M步：极大化$\bm{\theta}$
    $$
        \theta^{i+1} = \argmax_{\theta} Q(\theta, \theta^{i})
    $$
4. 循环迭代至收敛

## EM 的一些备注

- EM 对 $\bm{\theta}^{0}$ 的初始化敏感
    > 也许可以在初始化的时候引入一些先验知识？
- 收敛的判断可以为：
    1. $\|\theta^{i+1} - \theta^{i}\| < \epsilon$
    2. $\|Q(\theta, \theta^{i+1}) - Q(\theta, \theta^{i})\| < \epsilon$