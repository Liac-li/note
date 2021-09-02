# 高级机器学习

## 基础概念

- Inductive Bias: Ocam's razor, 归纳数据的时候选择那个更为简单的函数(更好的泛化？)
- No Free Lunch: $\mathcal{L}_a$ 比算法 $\mathcal{L}_b$ 在某些部分好，必然有一些问题 $\mathcal{L}_b$ 比 $\mathcal{L}_a$
    但是可以有在很多问题上 $\mathcal{L}_a$ 比 $\mathcal{L}_b$ 好
- Bias-variance Decomposition:

#### SVM

- 注意 $w^\top x + b = 0$ 其为一个任意缩放的 (scale free), 故而基础的 SVM 算法里令目标函数为 $w^\top x + b = 0$ , 而边界为 $y = \{1, -1\}$ 就也为缩放的事情了
    > 最原始的 SVM 的推导假设了最近的边界点为 $y = \{0, 1\}$ 就可以了解了，此处西瓜未说明
- 有 $\alpha_i \ge 0$ 可以使得 lagrange 后的函数中的 $\sum \alpha_i \Rightarrow \sum |\alpha_i| $ 会使得 $\alpha_i$ 稀疏
- **Kernel Trick**: 在 SVM 的 Kernel Function 的拓展中形式只有 $\phi(x)^\top \phi(x)$ 之以核空间中的内积的形式出现
    > Kernel Function 是否是对线性空间中的非线性问题的甩锅
- Regularization: $\min_l \Omega(l) + c\sum_{x\in D}l(x; D, y)$

    where:
    - $\Omega(\,)$ : structural risk
    - $\sum$ : experience risk

    Bayesian: 先验

#### 决策树

- 三个问题：
    1. 如何划分
    2. 如何选择特征
    3. 剪枝方法 

#### Bayesian Decision Theory

决策是一个造成 env 交互的过程，有目的性的，不是预测不一样的不造成影响

> Questions: 如何使用一些方法决定疫苗是否是有用的
> - 问题在于 AB 组对照之后就不能丢到去感染

#### Ensemble Learning

- Sequential:
- Parallel:

## Math Method