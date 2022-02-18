
**Independence of random variables**

$$
    P(\bigwedge_{i\in I}(X_i = x_i)) = \prod_{i\in I}P(X_i = x_i)
$$

**Expectation of random variable**

$$
    \mathbb{E}[x] = \sum_{x} x\cdot P(X=x)
$$

1. Let $X = X_1 + X_2 + \cdots$ then $\mathbb{E}[x] = \sum_{i=1}^n \mathbb{E}[X_i]$
    Linear property of expectation
2. $E[X] = E_Y[E_X[X|Y]]$
    $$
        \begin{align*}
            E[E[X|Y]] &= \sum_y E[X|Y=y]P(Y=y)\\
                &= \sum_y \sum_x xP(X=x|Y=y) P(Y=y)\\
                &= \sum_y \sum_x xP(X=x, Y=y)
                &= \sum_x xP(X=x)
                &= E[x]
        \end{align*}
    $$
    
Example 1:

Select keys to open door randomly from $n$ keys, X denote the number of selected keys until unlocking the door. Calculate $E[X]$ (without replacement)

Solution:

1. Be definitions
    $$
        \begin{align*}
            E[X] &= \sum_{k=1}^n k P(X=k)
        \end{align*}
    $$
    
    $$
        P(X=k) = \frac{n-1}{n} \frac{n-2}{n-1} \cdots \frac{1}{n-k-1} = \frac{1}{n}
    $$
    
    $$
        E[x] = \sum_{k=1}^n k \frac{1}{n} = \frac{n+1}{2}
    $$
    
2. Disassemble

    $$
        X_1 = \left\{
            \begin{align}
                &1, i-1 steps before not unlock the door\\
                &0, otherwise
            \end{align}
            \right.
    $$
    
    $$
        E[X_i] = \frac{n-1}{n}\frac{n-2}{n-1}\cdots \frac{n-(i-1)}{n-(i-2)} \\
            = \frac{n - i + 1}{n}
    $$
    
    $$
        E[x] = 1 + \sum_{i=2}^n \frac{n - i + 1}{n} = 
    $$
    
3. All expectation

    $$
        Y = \left\{
            \begin{align}
                1, & \text{第一次成功}\\
                0, &
            \end{align}
            \right.
    $$
    
    $$
        \begin{align*}
        E[x_n] &= \frac{1}{n} E[X_n|Y=1] + (1 - \frac{1}{n}) E[X_n|Y=0]\\
            &= \frac{1}{n} + (1 - \frac{1}{n})(1 + E[X_{n-1}]) \\
        \rightarrow\quad E[n] &= \frac{n+1}{2}
        \end{align*}
    $$