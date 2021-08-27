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

## EM 的推导
从最大化似然函数的角度开始

已知有$L(\theta) = \log P(Y | \theta)$,而开始的，引入$z$，有
$$
    P(Y|\theta) = \dfrac{P(Y, Z|\theta)}{P(Z|Y,\theta)}
$$

而我们想要有通过迭代的方式求解，故而有$L(\theta) > L(\theta^{i})$， 同时已知 Q 函数定义为:

$$
    Q(\theta, \theta^{i}) = \sum_{Z} \log P(Y, Z|\theta)P(Z|Y,\theta^{i})
$$

不妨也定义一个辅助函数$H$：
$$
    H(\theta, \theta^{i}) = \sum_{Z} \log P(Z|Y, \theta)P(Z|Y, \theta^{i})
$$

可以构造出 $\log P(Y|\theta)  = Q(\theta, \theta^{i}) - H(\theta, \theta^{i+1})$, 所以 $\log P(Y|\theta)$ 的差值：
$$
    \Delta L(\theta^{i}) = \log P(Y|\theta^{i+1}) - \log P(Y|\theta^{i}) \\
    = [Q(\theta^{i+1}, \theta^{i}) - Q(\theta^{i}, \theta^{i})] - [H(\theta^{i+1}, \theta^{i}) - H(\theta^{i}, \theta^{i})] 
$$

同时已知对于 $Q$ 函数， 我们的迭代策略是 $\argmax_{\theta}$ 故而有 $\Delta Q(\theta, \theta^{i}) \ge 0$, 此时只需要证明$\Delta H \le 0$ 

$$
    \Delta H = \sum_{Z} \log \left(\dfrac{P(Z|Y,\theta^{i+1})}{P(Z|Y,\theta^{i})}\right)P(Z|Y,\theta^{i})\\
    \le \log \left(\sum_{Z} \dfrac{P(Z|Y, \theta^{i+1})}{P(Z|Y, \theta^{i})}P(Z|Y,\theta^{i})\right) \\
    = \log \sum_{Z} P(Z|Y, \theta^{i+1}) = 0
$$

故而得证 $L(\theta) = \log P(Y|\theta)$ 为递增的，同时因为必然有 $L(\theta) \le 0$ , 故而 $L(\theta)$ 收敛。

**TODO**：证明 $\theta$ 的收敛值可以导致 $L(\theta)$ 的收敛值

## EM 的一些备注

- EM 对 $\bm{\theta}^{0}$ 的初始化敏感
    > 也许可以在初始化的时候引入一些先验知识？
- 收敛的判断可以为：
    1. $\|\theta^{i+1} - \theta^{i}\| < \epsilon$
    2. $\|Q(\theta, \theta^{i+1}) - Q(\theta, \theta^{i})\| < \epsilon$、

## Reference

1. 这个笔记是基于李航老师的《统计学习基础》
2.  

## Math Proof

#### $\log \sum_{j}\lambda_j x_j \ge \sum_j \lambda_j \log x_j$, where $\lambda_j \ge 0, \sum_j \lambda_j = 1$

仿射函数