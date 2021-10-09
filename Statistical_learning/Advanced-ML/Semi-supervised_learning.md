# Chap 13 半监督学习

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