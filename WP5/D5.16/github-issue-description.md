# Deliverable description, as taken from Github issue #114 on 2019-08-29 {.notoc}

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** CNRS
- **Due:** 2019-08-31 (month 48)
- **Nature:** Demonstrator
- **Task:** T5.1 (#99) 
- **Proposal:** [p. 51](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.16/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.16/))

**The Pari library** is a state-of-the-art library for number theory and an important component of the Sage computational system. Together with the `gp` command line interface and the `gp2c` compiler, it forms the Pari/GP package. This deliverable implements a generic parallel engine in the Pari/GP system, uses it inside the system to implement fast parallel variants of existing sequential code and exports it for library users. The released Pari/GP suite (PARI-2.12) makes those improvements and new features available for the community, in particular Sage users and all softwares using the Pari library.

The MultiThread engine transparently supports: 1) sequential computation, 2) POSIX threads (for a single multicore machine) and 3) Message Passing Interface (MPI, for clusters). It is used throughout the library to improve a large number of high-level mathematical algorithms, including fast linear algebra over the rationals or cyclotomic fields, fast Chinese remainders, resultants, primality proofs, discrete logarithms, modular polymomials and isogeny-based algorithms, motivic L-functions... Those implementations scale transparently between single core, multicore and massively parallel machines.
