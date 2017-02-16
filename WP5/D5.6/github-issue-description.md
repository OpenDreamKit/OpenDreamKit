# Deliverable description, as taken from Github issue #119 on 2017-02-08 {.notoc}

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** University of Kaiserslautern
- **Due:** 2017-02-28 (month 18)
- **Nature:** Demonstrator

The Quadratic Sieve is an algorithm for factoring integers n = pq, with n typically in the 15-90 decimal digit range. For this deliverable, we have implemented a quadratic sieve with the following features:

- Small prime variant
- Large prime variant with in-memory hash table and on-disk pseudorelation storage
- Multiple-polynomial self initialisation with Carrier-Wagstaff method
- Polynomial generation using Bradford-Monagan-Percival method
- Cache efficient sieving
- Block-Lanczos linear algebra (adapted from msieve)
- Knuth-Schroeppel multiplier
- Threaded relation sieving (using OpenMP)

Some partial progress towards this goal had already been completed before the OpenDreamKit project began, but the code didn't compile or run and was in an unusable state.

We have completed the [implementation](https://github.com/wbhart/flint2/tree/trunk/qsieve) and the code has already been merged into Flint.

Our implementation is not competitive below 130 bits (~40 digits), due to the Carrier-Wagstaff/Bradford-Monagan-Percival combination. Here are some timings for larger factorisations comparing Pari/GP with our implementation in Flint on one and four cores. There were no significant improvements for larger numbers of cores.

| n (bits)  |  Pari  |  Flint | 4 core |
|-----|---------|------|------|
| 130  |   0.11  |  0.24  |  0.28 | 
| 140  |   0.22  |  0.33  |  0.30 | 
| 150  |   0.43  |  0.55  | 0.39  | 
| 160  |   0.79  |  0.99  | 0.56  | 
| 170  |     1.8  |   1.4   |  0.83 | 
| 180  |     3.8  |   3.0   |  1.7  | 
| 190  |     8.6  |   4.8   |  2.4  | 
| 200  |   17.6  | 10.2   |  6.0 | 
| 210  |  38.4   |  20.9  | 13.5 | 
| 220  |  67.7   | 33.2   | 15.8 | 
| 230  |  199    |  78    |   34  | 
| 240  |  257    | 140   |   52 | 
| 250  |  444    |  248  |   92 | 
| 260  | 1175   |  708  | 283 | 
| 270  |  2199  | 1522 | 544 | 

Possible future projects could include:

- Cache efficient handling of factor base and self-initialisation data structures
- PPMPQS method
- Parallelising the file handling
- Writing an efficient self-initialising MPQS for 20-128 bits.

The Block Wiedemann algorithm computes kernel vectors of a matrix over a finite field. Along with the Block Lanczos algorithm it is often used in the Quadratic Sieve and Number Field sieve over GF2, but also has other applications over a prime p.

We investigated parallelising the Block Wiedemann algorithm using the external library M4RI for basic linear algebra over GF2. This required three components to be written.

- A sparse matrix library over GFp for Flint
- An implementation of the Block Wiedemann algorithm over GF2
- A naive quadratic sieve to generate realistic data

These were implemented by Anders Jensen and Alex Best and are available as [modules for Flint](https://github.com/alexjbest/flint2/tree/nmod_sparse_mat/nmod_sparse_mat) and as an [external implementation](https://github.com/alexjbest/bw) respectively.

Our experiments showed that it was possible to make use of the highly optimised SIMD arithmetic in the external library M4RI as a form of parallelism, to speed up the Block Wiedermann algorithm, and that this outperformed Block Wiedermann using M4RI in threaded mode, at least for the size and sparsity of problem encountered in the quadratic sieve! The result was comparable to the Block Lanczos code already used in Flint for the quadratic sieve.

The sparse matrix library was not the focus of this deliverable, but will be expanded at a later date and included in Flint. Because of the additional external dependency on M4RI, the Block Wiedemann implementation isn't eligible for inclusion in Flint, but the code is available to members of the OpenDreamKit collaboration. Future work may see the removal of this external dependency so that it can be merged into Flint.
