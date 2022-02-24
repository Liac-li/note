# Python code tips

Search with function name

## Tips

- shuffle multiple items remain corresponding order

```python
tmp = list(zip(iter1, iter2, iter3))
random.shuffle(z)
iter1, iter2, iter3 = zip(*tmp)
```

## Numpy

#### Broadcasting

How numpy treat **different shape** array during arithmetic operation

Small array $\xrightarrow[]{Broadcast}$ Large array (without needless memory copies)

**Rules**

compare arrays' shapes from trailing element-wisely, which means internal item will be remained to do calculation first. 

1. Dimensions are equal or
2. one of them is 1

```Python
A # m * n * z
B #       * z
A + B # m * n * z
```
```Python
A # m * 1 * z
B #     n * 1
A + B # m * n * z
```
