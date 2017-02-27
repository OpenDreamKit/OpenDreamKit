# Deliverable description, as taken from Github issue #115 on 2017-02-27 {.notoc}

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** Université Joseph Fourier (UJF)
- **Due:** 2017-02-28 (month 18)
- **Nature:** Demonstrator
- **Task:** T5.7 (#105) Pythran
- **Proposal:** [p.51](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.2/report-final.pdf)**

The [`Python`](http://python.org) programming language is widely used in the development of computational mathematics systems like [`SageMath`](http://sagemath.org) for its expressiveness and flexibility. Yet, as an interpreted language, it suffers from inherent inefficiencies.

Over the years several tools have been developed to overcome this barrier. A major player is [`Cython`](http://cython.org), which is both an extension of the Python language, and a compiler generating compilable `C` code.  At the cost of additional work from the developer (e.g. type annotations), `Cython` can deliver performances similar to that of a compiled language. It's being used intensively in `SageMath`.  Another emerging player is [`Pythran`](https://pythonhosted.org/pythran/), a `Python` to `C++` compiler for a subset of the `Python` language, with a focus on scientific/numerical computing. It takes advantage of type inference features of `C++` as well as multi-cores and SIMD instruction units to deliver high performance without the need for additional work from the developer. In particular, it includes a `C++` implementation of a major subset of the `Numpy` API, optimized for speed, with support for expression templates that minimize the number of memory transfers needed to compute complex expressions ([`Numpy`](http://numpy.org) is the fundamental package for scientific computing with `Python`). However, unlike `Cython`, `Pythran` does not support user defined classes, a key feature in systems like `SageMath`.

This deliverable is a step toward taking the best of both worlds, and helping bridge the gap between numerical and exact computing. It proposes to incorporate `Pythran` support for `Numpy` within `Cython`, which consequently provides high performance numerical linear algebra to high level mathematical software developers, especially within `SageMath`.

As an illustration, the new `Pythran` backend in `Cython` achieves a speed-up of about 4 on the following typical `Numpy` based function:

    def sqrt_sum (numpy.ndarray[FLOATTYPE_t, ndim=1] a,
                  numpy.ndarray[FLOATTYPE_t, ndim=1] b):
        return numpy.sqrt(numpy.sqrt(a*a+b*b))

