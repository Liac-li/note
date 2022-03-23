# 文本分类

## Naive Bayesian

- $\bm{w}$ one-hot vector of vocab dictionary
- Target: $P(\bm{w} | \bm{c})$ $\bm{c}$ for cat

- Estimate likelihood: $\hat{P}(\bm w | \bm c) = \frac{n(\bm{w}_t)}{N_k}$ $n(w_t)$ number of class with $\bm{w}$ observed, $c_k$ total documents in $c_k$

## Text Rep

#### Symbolic Encoding

##### Ont-hot (Bag of words)

**Disadvantage**:
1. all word vectors are orthogonal (Independence)
2. all word with same weight
3. Too large dimension

> Features:
> Negative, etc.

#### Distributed representation

> Shrink the large dimension of Bag-of-word, change the distribution of all words, to have some similarity between words

*We can get a lot of value by representing a word by means of its neighbors*

##### Latent Semantic Index

> Use context to represent a word
> LSA ??? 

- Use **co-occurrence** Matrix
    - $\bm{X}\in \mathbb{R}^{n\times m}$ word-document matrix: row for words, columns for documents
    
    - $\bm{XX^T}\in \mathbb{R}^{n\times n}$: similarity between words
    - $\bm{X^TX}\in \mathbb{R}^{m \times m}$
    
- To represent the term-document space by a **lower dimensional latent space**
    - Use SVD
    
**Disadvantage**:
- Computation cost
- linear model
- k?
- don't consider order of word
- hard to incorporate new words or documents

> Farther: pLSI;

##### Topic Model

##### Word2Vec

## Text Classification

#### Naive Bayesian

$$
    \begin{align*}
        \argmax_{c_k} P(c_k | \mathcal{D}) &= \argmax_{c_k} \frac{P(\mathcal{D}|c_k)P(c_k)}{P(\mathcal{D})} \\
            &= \argmax_{c_k} P(\mathcal{D}|c_k)P(c_k)
    \end{align*}
$$

To represent D: 
1. one-hot vector with size $|V|$

    thus, for $D_{i}^t$ is the $w_t$ in document $D_i$, represented with either 0 or 1

    $$
        \begin{align*}
            P(D_i^t|c_k) &= D_i^t P(w_t | c_k) + (1 - D_i^t)(1 - P(w_t|c_k)) \\
            P(D_i | c_k) &= \prod_{t=1}^{|Vocab|} P(D_i^t|c_k)
        \end{align*}
    $$
2. vector with word counting => $D_i^t$ is the times of $w_t$ occurs in $D_i$
    $$
        P(D_i|c_k) = \frac{n!}{\prod_{t=1}^{|V|}D_i^t !} \prod_{t=1}^{|V|} P(w_t|c_k)^{D_i^t}
        \\
        P(w_t|c_k) = \frac{\sum_{i=1}^N D_i^t \mathbb{I}_i^k}{\sum_{t=1}^{|V|} \sum_{i=1}^N D_i^t \mathbb{I}_i^k}
        \\ \\
        \mathbb{I}_i^k = \left\{
            \begin{aligned}
                0, &\quad D_i \text{ has class } c_k\\
                1, &\quad otherwise
            \end{aligned}
        \right.
    $$
    
#### Linear model

Target to minimize loss function: $L(y, \hat{y})$
$$
    \hat{y} = \argmax_y \psi(x, y) = \argmax_y \bm{\theta}\cdot f(x, y)
$$
    

1. Perceptron:
    $$
        l_{percetron}(\bm{theta}; x^i, y^i) = \max_{y \in \mathcal{Y}} \bm{\theta}\cdot \bm{f}(x^i, \hat{y}) - \bm{\theta}\cdot \bm{f}(x^i, y^i)
    $$
2. logistic-regression:
    $$
        p(y| x; \bm{\theta}) = Softmax(\bm{\theta}\cdot \bm{f}(x, y_{ground\_truth}))
    $$
    
Next question: How to define the score function $f(x, y)$

- feature engineering
    - bm25, tf-idf
    - stop words
    - mutual information
    - $\Chi ^2$

## Tools

- WordNet