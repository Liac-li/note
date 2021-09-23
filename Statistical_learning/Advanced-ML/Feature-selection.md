# Chap 11 特征选择与稀疏学习

TODO: 特征子集的评价

**子集评价**： 利用信息熵

#### 特征选择

- 过滤式(Filter)：利用一个score function来评价特征子集
- 包裹式(Wrapper)：直接训练模型来评价精度 (感觉训练成本会很大， 但是其分类会比较适合)
- 嵌入式

    把正则化的 $L_2$ 范数换成 $L_1$ 范数，容易或者稀疏解

##### Relief

target：如何设计打分函数

对于特征做一个打分，而特征子集的打分使用特征的打分

> 统计的值满足偏序(子集的值一定更小)
> **Assumption**:值是同量纲的（可以一起比较）

##### LVW (Las Vegas Wrapper)

- 产生随机的特征子集
- 利用交叉验证进行评价
- 多个结果进行比较，取最优

##### $L_1$ 正则化问题

利用PGD(Proximal Gradient Descend)解法

$$
  \min \sum_{i=1}^m f(\bm{x}) + \lambda \|\bm{x}\|_1
$$

TODO: pumpkin 推理




