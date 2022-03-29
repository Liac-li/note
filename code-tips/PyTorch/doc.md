## Auto Grad

[Web-site](https://pytorch.org/docs/master/notes/autograd.html)

- Trace a graph of how user create tensors as executing operations, giving you a directed acyclic graph whose leaves are the input tensors and roots are the output tensors.

#### Locally disable gradient computation

- set `requires_grad`
    - Forward pass: an operation only recorded if at least ont of its input tensors require grad
    - Backward pass: only leaf tensors with `requires_grad=True` will have gradients into their `.grad` fields
    - non-leaf tensors' gradients will be needed as intermediary result (tensors have `grad_fn`), not like leaf tensors
    
    apply `.requires_grad_(False)`
- Grad Modes:
    1. Grad Mode(Default): 
        default mode is that it is the **only** mode in which `requires_grad` takes effect. `requires_grad` is always overridden to be False in both the two other modes.
    2. No-grad Mode
        Enable no-grad mode when you need to perform operations that should not be recorded by autograd, but you’d still like to use the outputs of these computations in **grad mode later**
    3. Inference Mode
        enabling inference mode will allow PyTorch to speed up your model even more (than No-grad mode)
        > tensors created in inference mode will not be able to be used in computations to be recorded by autograd after exiting inference mode
    
    > `model.eval(); model.train()` are orthogonal to no-grad mode and inference mode

#### Hook for saved tensors

You can control how saved tensors are packed / unpacked by defining a pair of `pack_hook` / `unpack_hook hooks`

tensor -> `pack_hook` -> any python object -> `unpack_hook` -> tensor (used in backward pass)
- `pack_hook` & `unpack_hook` functions take single argument
- output tensor of `unpack_hook` only needs to have the same content as the tensor passed as input to `pack_hook`
- !!! Performing **inplace operations** on the input of any of the functions is forbidden as they may lead to unexpected **side-effects** (check document of in-place operation on web)

TBD [extending-pytorch](https://pytorch.org/docs/master/notes/extending.html)