# RNN LSTM GRU

## RNN

#### Theorem

- Infinite windows size: ambiguous RNN layers' number (theoretically)

At each RNN layer

$$
    h_t = \sigma(W^h h_{t-1} + W^x_h x_t)\\
    \hat{y} = softmax(W^s h_t) 
$$

- $W^h, W^x$ are used to condition the hidden state or input vector for all time steps 

**Loss function**:

- At each time step $t$: we use cross-entropy
    $$
        J^t(\theta) = -\sum_{j=1}^{|Vocab|} y_{t,j}\times \log (\hat{y}_{t, j})
    $$
    
    but $\hat{y}$ is result of softmax, the size is huge given numerous words within vocabulary
    
- Over corpus of size $T$:
    $$
        J = \frac{1}{T} \sum_{t=1}^T J^t(\theta)
    $$