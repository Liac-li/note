# Lec 6

## Feature Normalization

> Transpose sample to have consistent features
> Batch Norm???

- Per-dimensional normalization
    - 不同的量纲
    - 不同的取值范围
    $$
        x_{ij} \leftarrow \frac{x_{ij} - x_{min, j}}{x_{max, j} - x_{min, j}}
    $$
    
    for each dimension(feature) of all data (linear transformation)
    
    - Problems:
        - $x_{max,j} = x_{min, j}$: delete this dimension, with no information
        - to $[-1, 1]$
        - Spars data: with many 0
            - 0 -> meaningless; actual value (if meaningless, need 0 -> 0)
- $l_2, l_1$ normalization (on each data)
    $$
        x_{ij} \leftarrow \frac{x_{ij}}{||x_i||_2}
    $$
    
    $l_1$， 对于非负特征 $x_{ij} \ge 0$ (may $\sum_{j}x_{ij} \neq 1$)
- zero-norm (feature)
    - to N(0, 1)
    $$
        x_{ij} \leftarrow \frac{x_{ij}-\mu_j}{\sigma_j}
    $$
    
not search mean, variance, max/min value from **test set**

> never use test set unless do testing

but under assumption, test and training data are sampled from the same distribution i.i.d, use train data

## Fisher's Linear Discriminant Analysis

> Optimal linear feature extraction method under certain assumption

> PCA 有利于表示数据，但是和分类无关 (无法改变分类分布 $P(x|y=i)$)

Target: let multiple categories of data are separated as much as possible after projection

**From two class**

- Separated: ???
- in Fisher: let means are separated
    Let maximize $(m_1 - m_2)^2$
    - up to infinity?: with $w^T w = 1$
    - or may be no as large as possible?: Fishier rule 
    
    let data in same class more focused after projection 

**Fisher rule**
$$
    J(\bm{w}) = \frac{(m_2 - m_1)^2}{s_1^2 + s_2^2}
$$

-   within class scatter (not variance) 
    $$
        S_k^2 = \sum_{y_i = k}(u_i - m_k)^2
    $$

- within class scatter matrix
    $$
        \bm{S}_k = \sum_{y_i = k}(\bm{x_i} - \bm{\mu_k})(\bm{x_i}-\bm{\mu_k})^T
    $$
- between-class scatter matrix
    $$
        \bm{S_B} = (\bm{\mu_2} - \bm{\mu_1})(\bm{\mu_2} - \bm{\mu_1})^T
    $$
    
    > How to calculate
    
    
> ??? c 类问题只能有 c-1 个有效的投影方向