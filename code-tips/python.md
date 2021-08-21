# Python code tips

Search with function name

## Tips

- shuffle multiple items remain corrospending order

```python
tmp = list(zip(iter1, iter2, iter3))
random.shuffle(z)
iter1, iter2, iter3 = zip(*tmp)
```

