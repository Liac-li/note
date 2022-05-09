# Lexical Annotation

Upstream task

> 7 Mainstream paradigms in NLP
>
>| | Input | Output |  |
>| :-: | :-: | :-: | :-: |
>| class  | text | label |
>| matching | textA; textB | label |query & match the best |
>| SeqLab | A; B; C | $L_a, L_b, L_c$ | lexical annotation| 
>| MRC(machine read recension comprehension) | Context; Question | start; end | 
>| seq2seq | <a, b, c> | <D, E, F> | 异步的; 非等长的 | 
>| seq2ASeq |   |  | seq 2 actions, complier | 
>|(M)LM (mask language model)| A, [mask], C | B | BERT |

#### Part of speech Tagging

*Why?* - structure of sentence (grammar + sematic meaning)

Input X: $\Sigma^*$, (surface word sequence)
Output Y: $\Lambda^*$ (part-of-speech sequence) POS seq

- Name entity recognition (NER)
    Ambiguity:
    1. length (chinese)
    2. property 
    3. phrase and words 
    
    - 确定实体的边界
    - 确定实体的类型

    Use **IO label**
    
    $\mathcal{Y}: ((\Lambda \times \{B, I\}) \cup \{O\})^*$
    
    任务转化为序列化标注 sentence 中的所有的的词
    
Statistic Method: $\mathcal{f}: X \to Y$

决定词的词性的因素：词语的用法 + 句子中的语法功能
统计学角度：本身的词 + 上下文的词(标注)

**HMM**

> 简化了输出上 $y_{1:n}$ 之间反复的相互联系
> 单向模型

$$
    P(W, T) = \prod_i P(t_i | t_{i-1}) P(w_i|t_i)\quad \text{(bigram)}
$$

Target: parameters estimation: ($\bm{\lambda} = (A, B, \bm{\pi})$)

Tags are hidden state, and words are observation

> PER -> O -> OBJ -> ...
> Jeff   is   ill

In supervised training, use counting to approx EM method

**In lexical annotation**

Train: Encoder
Inference: Decoder
    $$
        \begin{aligned}
            \hat{t}_{1:t} &= \arg\max_{t_{1:t}} P(t_{1:t}|w_{1:t})\\
            &= \arg\max \frac{P(w_{1:n}|P(t_{1:n}))P(t_{1:n})}{P(w_{1:n})}\\
            &= \arg\max P(w_{1:n}|t_{1:n})P(t_{1:n})\\
            &= \arg\max \prod_{i=1}^n P(w_i|t_i) \cdot \prod_{i=1}^n P(t_{i}|t_{i-1})
        \end{aligned}
    $$
    
- Speed up: Viterbi algorithm
    TODO: TBD
    
Problem in HMM:
1. Estimate by counting: sparse problem
2. Generative model:
3. markov assumption: may not hold
4. Supervised model 

#### CRF

HMM transfer posterior probability to prior, in CRF, to module the posterior probability $\hat{y} = \argmax_{y\in \mathcal{Y}} P(y|x)$


$$
    P(y|x) = softmax\left(\sum_{k=1}^K w_k F_k(x, y)\right)
$$

$F_k(...)$ for feature function

$$
   F_k (X, Y) = \sum_{i=1}^n f_k(y_{i-1}, y_i, X, i) 
$$

