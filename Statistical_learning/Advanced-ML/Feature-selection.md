# Chap 11 特征选择与稀疏学习

**子集评价**： 利用信息熵

#### 特征选择

Target:
1. 多个特征回导致维度灾难
2. 提取关键的特征可以提升学习器的效果

??? Information Gain can only apply on backward search

- 过滤式(Filter)：利用一个score function来评价特征子集
- 包裹式(Wrapper)：直接训练模型来评价精度 (感觉训练成本会很大， 但是其分类会比较适合)
- 嵌入式: 同时进行学习器训练和特征选择

    把正则化的 $L_2$ 范数换成 $L_1$ 范数，容易或者稀疏解

##### Relief

target：如何设计打分函数

$$
  \delta^j = \sum_i -diff(x_i^j, x_{i, hit}^j) + diff(x_i^j, x_{i, miss}^j)
$$

我们 $\max \delta^j$ , 也即鼓励选取 label $j$ 对于分类有更多的帮助

对于特征做一个打分，而特征子集的打分使用特征的打分

> 统计的值满足偏序(子集的值一定更小)
> **Assumption**:值是同量纲的（可以一起比较）

##### LVW (Las Vegas Wrapper)

- 产生随机的特征子集
- 利用交叉验证进行评价
- 多个结果进行比较，取最优

??? 根据西瓜书P251的代码，感觉LVW不能找到最优的解

##### $L_1$ 正则化问题

利用PGD(Proximal Gradient Descend)解法

$$
  \min \sum_{i=1}^m L(f(\bm{x}), \bm{y}) + \lambda \|\bm{x}\|_1
$$

最小化学习器误差 + **稀疏化解**($\|\,\|_1$的稀疏化解)

此处注意对于$f(x)$ 有有个 L-Lipschitz 条件
$$
  |\nabla f(x') - \nabla f(x)| \le L|x' - x|
$$

基于此条件化简taylor的二阶项

(此处是一堆推导，看pumpkin)

$$
  x_{k+1} = \arg \min \frac{L}{2} \|x-\left(x_k - \frac{1}{L}\nabla f(x_k) \right)\| + \lambda \|x\|_1
$$

> PGD 强依赖于 L-Lipschitz 条件，而简化迭代推到的过程
> 一般的看$f(x) = Loss(f(x), y)$

#### 稀疏表示

我们可以考虑到对于字典的word的选择，其mask vector 天生的比较稀疏， 故而目标就是学习一个"字典" $\to$ 得到稀疏的编码

$$
  \min_{B, \alpha_i} \sum_{i=1}^m \|x_i - B\alpha_i\|_2^2 + \lambda \sum_{i=1}^m\|\alpha_i\|_1
$$

- $B\alpha_i$ 就是字典矩阵加上mask选择的重构形式

因为要学习$B, (\alpha)_{ij}$, 直接交叉替换顺序进行学习

值得注意的是 $E_i = X - \sum_{j\neq i}b_j\alpha^j$ 的直接SVD会破坏 $B, \alpha$ 的稀疏性，故而利用 **KSVD** (只保留非零项而后SVD)

#### 压缩感知(Compressive sensing)

TODO: 补充note， 不想看了

