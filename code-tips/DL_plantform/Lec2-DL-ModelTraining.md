# Deep Learning Model Training

Training Data + Testing Data

**Loss**:

- Large loss on Traindata:
    - model bias: use more complex model
        Function space(candidate function set) is too small => not learnable for the given problem
        > Larger model needs more data to reduce the loss [learning Theorem: $R(f) = \bar{R} + \frac{\text{model complexity}}{\sqrt{g(N)\text{data size}}}$] 
        > and more data argument
    - optimization: import optimization
        - Trap into local optimization
- Small loss on TrainData:
    - loss on TestData:
        overfitting or mismatch
        
**Overfitting**

small lose on training data, but large on test data

different data distribution with ground truth

- more training data to reduce 
- do data augmentation
- add regularization

**Model selecting**

1. N-Fold cross validation: mean of all data block

**Optimization**

Saddle point V.S. Local Minima

On high dimension of parameter, thus, a most of cases are saddle point. (select great direction(gradient))

- Small gradient:
    1. slow at the plateau
    2. stuck at saddle point
    3. stuck at local minima
    
- Batch:
  - small size: smaller need more time in each epoch
  - larger: Because parallelism of GPU, training time is not increasing significantly during each batch

    *But* may stack on point where model data has small gradient at.(stability of gradients)
    
- Momentum
