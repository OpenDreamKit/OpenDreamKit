# Deliverable description, as taken from Github issue #112 on 2019-08-31 {.notoc}

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** Univ. Grenoble Alpes
- **Due:** 2019-08-31 (month 48)
- **Nature:** Demonstrator
- **Task:** T5.3 (#101)
- **Proposal:** [p. 51](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.14/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.14/))

# Context
Computational linear algebra is a key tool delivering high computing throughput to applications requiring large scale computations. In numerical computing, dealing with floating point arithmetic and approximations, a long history of efforts has led to the design of a full stack of technology for numerical HPC: from the design of stable and fast algorithms, to their implementation in standardized libraries such as LAPACK and BLAS, and their parallelization on shared memory servers or supercomputers with distributed memory.

On the other hand, computational mathematics relies on linear algebra with exact arithmetic, i.e. multiprecision integers and rationals, finite fields, etc. This leads to significant differences in the algorithmic and implementation approaches. Over the last 20 years, a continuous stream of research has improved the exact linear algebra algorithmic; simultaneously, software projects such as LinBox and fflas-ffpack were created to deliver a similar set of kernel linear algebra routines as LAPACK but for exact arithmetic. 

The parallelization of these kernels has only been partially addressed in the past, and was mostly focused on shared memory architectures.

# Achievements of the deliverable
This deliverable aims at enhancing these libraries so that they can exploit various large scale parallel architectures, including large multi-cores, clusters, and accelerators. The target application is the solver of linear systems of the field of multi-precision rational numbers. For this application, several algorithmic approaches have be studied and experimented, namely a Chinese Remainder based solver and a p-adic lifting solver. The former exposes a much higher level of parallelism in its tasks, while the latter requires many fewer operations asymptotically. We first focus on the algorithmic aspects, with the presentation of a new p-adic lifting algorithm based on Chen and Storjohann's algorithm. We then present the implementation and related experiments of a MPI-Chinese-remainder-based rational solver for distributed computing, and an implementation of the new p-adic algorithm. Lastly we report on the support for GPU made available in fflas-ffpack and related benchmarks.
