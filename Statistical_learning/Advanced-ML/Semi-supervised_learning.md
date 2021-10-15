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

TODO: Note

> 可以利用 Markov Chain 的 Random walk 来解释
> $P_{uu}$ 来作为一个 Transformation Matrix 来对于$f_l$随机游走

#### 分歧学习

View 的要求：
1. 充分(Sufficient): 独立的view 包含足够用于训练的数据 (足够大)
2. 条件独立(Independent): 不同的 view 相互条件独立 (given label set)


#### Father Topic

- Positive Unlabeled Learning
- Weak Label learning
- Multi-Instance Learning ($*$)