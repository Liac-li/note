# AutoEncoder 

**a architecture with a narrow bottle-neck in DNN** => force model to learning some key feature in low dimension representation

input $\xrightarrow[\bm{W}_i]{encode}$ hidden layer $\xrightarrow[\bm{W_i^T}]{decoder}$ input*


to minimize the loss $L = (x - \hat{x})^2$

> Unsupervised Learning

??? why Deep auto-encoder get better result than PCA using linear projection
have more parameters to store information?

## Application

- Text Retrieval
    may good for classification
- Similar image search
- Pre-training DNN    
- Add noise in encoder, to get a more robust model

use regularization use such as $||\bm{W}_i|| = 1$ to limit the not to copy the input data



