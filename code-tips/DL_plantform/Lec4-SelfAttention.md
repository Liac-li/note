# Self attention

- for input formed as sequence(or set) of vectors

as RNN, each input vector corresponding to a output vector

- Each vector has a lebel [*]
- whole sequence has a label
- model decide the length of output

Introduce context information to current vector in sequence

Treat self-attention as a neural network layer

#### How to?

- Target: find the relevant vectors, as $\alpha$

1. Dot-product:
    $$
        \alpha_{ij} = \bm{W}^q a_i \cdot \bm{W}^k a_j
    $$
    
    - Query weight $\bm{W}^q$, keys weight $\bm{W}^k$ are shared between all vectors
    - Also, we will calculate a self-attention score as $\alpha_{ii}$ ??? is it important
    - $$
        \bm{v}_{mask} = Softmax(\bm{\alpha}) \\
        $$
    - 
        $$
            \bm{y} = \bm{W}^v \bm{x} \circ \bm{v}_{mask}
        $$
    - self-attention is calculated parallelly

    - Why multi-head attention:
    - changes on input order has no effect on output order

2. Additive:

- [Blog-attention](https://lilianweng.github.io/posts/2018-06-24-attention/)