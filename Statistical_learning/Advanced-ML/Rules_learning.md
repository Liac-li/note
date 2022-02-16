# 规则学习

#### 序贯覆盖

> 贪心的算法
> 和决策树关联一下

#### 剪枝算法

- 预剪枝：

    $$
        LRS = 2\cdot \left(\hat m_+\log\frac{\frac{\hat m_+}{\hat m_+ + \hat m_-}}{\frac{m_+}{m_+ + m_-}} +\hat m_-\log\frac{\frac{\hat m_-}{\hat m_+ + \hat m_-}}{\frac{m_-}{m_+ + m_-}} \right)
    $$
    
    - LRS 大： 说明规则的效果与观察不一致
    - LRS 小： 效果趋近于随机

- 后剪枝：(REP)
    - 穷举所有的可剪枝的内容(规则，文字)
    - 反复使用test set验证，直到没有提升

#### 一阶规则

> 其上的是命题逻辑

1. 一类的规则
2. 常量对于变量的替换
3. 推出(蕴含) $\to$

- pre-condition 总是一个合取范式，但是子句是一个析取范式

