# tf.keras note

## Data sets

- MINST: handwritten digit
- Fashion MNIST:  grayscale images in 10 categories, representing articles of clothing 

## keras.layes

- `tf.keras.layers.Flatten`
Flat the data to only one dimension, **with no parameters to learn**
- `tf.keras.layers.Dense`
Densely connected, or fully connected neural network layer, like
$$
	Dense = act(\bm{W}x + \beta)
$$
	- $act()$ activation funciton
	- $\bm{w}$ kernel, initialize with *glorot_uniform*, refer as [glorot10a.pdf](http://proceedings.mlr.press/v9/glorot10a/glorot10a.pdf)
	- $\beta$ bias

## keras.Sqeuntial()

groups a linear stack of layers into a `tf.keras.Model`

### Methods

- `compile`: configures the model for training, with parameters(important) - optimizer, loss, metrics 
- `evaluate`: run loss value & metrics values for model in **test mode**
- `fit`: train model for fixed number and epochs
- `predict`
- `save`: save model to Tensroflow SavedModel or a single DHF% file
- `summery`: