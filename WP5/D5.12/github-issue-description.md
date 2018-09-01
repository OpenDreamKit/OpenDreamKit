# Deliverable description, as taken from Github issue #110 on 2018-08-31 {.notoc}

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** Universite Grenoble Alpes
- **Due:** 2018-08-31 (month 36)
- **Nature:** Demonstrator
- **Task:** T5.3 (#101) LinBox
- **Proposal:** [p. 52](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)

# Context
Computational linear algebra is a key tool delivering high computing throughput to applications requiring large scale compuations. In numerical computing, dealing with floating point arithmetic and approximations, a long history of efforts has lead to the design of a full stack of technology for numerical HPC: from the design of stable and fast algorithms, to their implementation in standardized libraries such as LAPACK and BLAS, and their parallelization on shared memory servers or supercomputers with distributed memory.
On the other hand, computational mathematics relies on linear algebra with exact arithmetic, i.e. multiprecision integers and rationals, finite fields, etc. This leads to significant differences in the algorithmic and implementations approaches. Over the last 20 years, a continuous stream of research has improved the exact linear algebra algorithmic and simultaneously, software projects, such as LinBox and fflas-ffpack were created to deliver, a similar set of kernel linear algebra routines as LAPACK but of exact arithmetic. 

# Goal of the deliverable
This deliverable aims at taking a major step forward in the advancement of this technology stack for exact linear algebra: the development of new application frameworks, new algorithms, their careful implementation as high performance kernels in a standardized library. As a demonstrator for the usability of this building block for the development of virtual research environment, a key outcome of this deliverable is a tight integration of the libraries LinBox and fflas-ffpack into the software SageMath.
