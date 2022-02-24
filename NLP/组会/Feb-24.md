## 基于meta的小样本学习

> hanj ye

with assumption to reduce the scaler of data （度量学习）

1. 模型的泛化能力
2. 减少样本的的数量

- 数据：从数据中抽取先验，关键的样本
- 算法：分析机器学习的腌本误差度
    泛化界 $R(f) \le \bar{R}(f) + \frac{\cdots}{\sqrt{N}}$ $...$ 为模型复杂度
    
    设计 **强凸，平滑** 的目标来减少模型的样本复杂度
    > 岭回归 - 强凸
- 模型：复习那个相关任务的模型(大模型的预训练的迁移使用)

#### Few-short learning

- 在相关数据上学习一些经验 Pre-train + fine-tune
    Q: Pre-train的模型是否可以适应当前的小样本任务
- 在相关数据**模拟**未来的小样本的学习任务 (元学习)
    Q: 数据(分布)的相关性度量
    
    在相关数据中构建小样本学习

    Q：how $f$ on given test set transfer to $f^*$
    - With parameter
        1. 基于 Embedding: *Matching Network for on shot learning*
            更新一个 $\Phi(x)$ 来作为特征提取的函数, 在相关样本中学习到的
        2. *Prototypical Network*

    - No parameters: *MAML(Model-Agnostic Meta-Learning for fast adaptation of deep learning)*
        学习一个小样本任务的**公用的模型初始化参数**, 经过**固定步数**的梯度下降可到不同的较好的小样本模型

    Q: Embedding 的跨任务泛化能力
    
#### Application

**Hyper-Parameter Tunning**:

Evolution of Model: 离散的一部分 $\times$ 连续的一部分优化

> NARTS, DARTS

**Multi-Task Learning**:

在已有的n个任务上做好，在新的 n + 1 上做好 -> mata-learning

> Zero-shot learning

> *A Meta_learning Perspective on Cold-Start Recommendation Items 
