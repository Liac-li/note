# Language Model

- N-Gram
- Linear LM
- Neural Network LM

Compute a probability of a sentence $P(w_1, w_2, \dots w_n)$
or $P(w_i | w_{1:i-1})$

#### N-Gram

History based model:
$$
    \begin{align}
    P(W) &= P(w_1, w_2, \dots,w_n)\\
        &= P(w_1)P(w_2|w_1)P(w_3|w_1, w_2)\dots P(w_n|w_{1:n-1})
    \end{align}
$$

Impractical to condition on everything before

- Markov Assumption
    - Limited Horizon; only relay on k before word
        (k-degree markov chain)
        $$
            P(W) \approx \prod_{cur}^n P(w_{cur}|w_{cur-1:cur-k})
        $$
> Auto-regressive => all ar model is Language model

- Problems
    - Sparsity problem
        - Smoothing: laplacian smooth $\frac{n + 1}{m + |V|}$
        - reduce the $n$, bigram -> unigram $\frac{P(x)}{P(w_{i-k}:w_{i-1})} \to \frac{P(x)}{P(w_{i-k+j}:w_{i-1})}$
    - Storage problem
        - Parameters: $k \to |V|^{k+1}$
    - use dictionary:
        - less in verity
        - with personal own subjective experience 

Therefore, LM is applied to predict the next word
        
A simple linear graphic model

**Problem**:
- parameter's number increase exponentially with $n$ ($n \to |V|^n$)

> likelihood & probability

> Zipf Low
> 以词语频率排序，词频和排位的乘积接近于一个常数
> 大部分的词语都是稀有的: (长尾) 不可能搜索到足够的数据来得到稀有的事件的完整概率分布
> => Zero probability: smooth, 等价类

- calculate probability on syntax not on the sematic (considering long term dependency)

## Word embedding

#### Discrete representing

#### Distribution representing

use a dense vector in lower dimension (than one-hot)

key: **word's sematic meaning can be represented with its context** 

> *We shall know a word by the company it keeps*

**Word2Vec**

- Continuous bag of words
    - likelihood function
    $$
        L(\theta) = \prod_{i=0}^n P(w_i | w_o; \theta)
    $$
    - loss function
    $$
        J(\theta) = -\frac{1}{n}L(\theta)
    $$
    - Problem:
        - Softmax need to pass through all vocabulary at each step => use negative sample
- skip-gram 

**GloVe**



