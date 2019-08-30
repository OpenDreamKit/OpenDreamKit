# Deliverable description, as taken from Github issue #111 on 2019-08-29 {.notoc}

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** University of Kaiserslautern
- **Due:** 2019-08-31 (month 48)
- **Nature:** Demonstrator
- **Task:** T5.4 (#102)
- **Proposal:** [p. 51](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.13/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.13/))

Singular is a computer algebra system aimed at computations in algebraic geometry and is one of the key components used by SageMath. Computing with multivariate polynomials being at the core of Singular, their performance impacts the whole system.

The aim of this deliverable was to modernize Singular's sparse multivariate arithmetic by 1) updating the algorithms to the state of the art and by 2) applying thread level parallelism to achieve decent scaling on multi-core machines. The operations we focused on are multiplication, divisibility testing, and the computation of the greatest common divisor. The implementation was carried out in the C library Flint, which is used by Singular but also by independent systems.  The latter thus also benefit from the improvements. Among many other applications, this tackles the long standing slowness of multivariate rational fractions in SageMath.
