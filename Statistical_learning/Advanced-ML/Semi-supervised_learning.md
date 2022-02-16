# Chap 13 半监督学习

Data Set 有一部分是有标记的学习任务

因为ML假设样本点都是i.i.d. 采样来的，我们*相信*同一种类的样本之间分布会有一些关系，故而可以更好的利用未标记样本

#### 生成式方法

利用人为预定的先验模型来做参数估计

- EM
- Max Likelihood
- Bayesian Method

#### 图半监督学习

把数据集认为是一个图，相关性高的点之间会存在边
> 可以理解为进行一个 labeled item 的扩散

定义一个能量函数:
$$
  E(\bm{f}) = \bm{f}^\top (\bm{D -W})\bm{f}
$$
1. $\bm{D - W}$ 是半正定的
2. $E(\bm{f})$ 的形式就很像是一个距离的定义 ??? 证明
  那么就是让$\bm{f}$在有标记样本和无标记样本上预测类似

> 可以利用 Markov Chain 的 Random walk 来解释
> $P_{uu}$ 来作为一个 Transformation Matrix 来对于$f_l$随机游走


##### 多分类问题(同个feature有多个取值)

利用$\bm{F}$来代替$\bm{f}$来做标记传播

有
$$
  \bm{F}(t) = \alpha \bm{SF}(t-1) + (1 - \alpha)\bm{Y}
$$
> 指数平均加一个传递系数

展开得到有
$$
  \bm{F}(t) = (\alpha\bm{S})^t Y + (1-\alpha) \sum_{i=1}^{t-1}(\alpha\bm{S})^iY
$$

做极限得到:
$$
  \begin{align}
    \lim_{t\to\infty} (\alpha S)^t &= \bm{0} \\
    \sum_{i=0}^{t-1} (\alpha \bm{S}) &= \frac{\bm{I}(I - (\alpha \bm{S})^{t-1})}{\bm{I} - (\alpha \bm{S})} \\
      &= \frac{\bm{I}}{\bm{I} - \alpha\bm{S}} \\
      &= (\bm{I} - \alpha \bm{S})^{-1}
  \end{align}
$$
矩阵的极限见[wiki-Laplacian Matrix](https://en.wikipedia.org/wiki/Laplacian_matrix.)


??? 多分类和二分类之间有什么相关性么

#### 分歧学习 (Disagreement-Based Method)

> 走到了集成学习的道路上

View 的要求：
1. 充分(Sufficient): 独立的view 包含足够用于训练的数据 (足够大)
2. 条件独立(Independent): 不同的 view 相互条件独立 (given label set)(但是比较的难以满足)

行为：反复的利用有标记样本学习器分类无标记样本，然后加入有标记，多次训练
> 最大置信度的$n$的挑选是超参
> view 的生成也很tricky

TODO: 半监督聚类

#### Father Topic

- Positive Unlabeled Learning
- Weak Label learning
- Multi-Instance Learning ($*$)