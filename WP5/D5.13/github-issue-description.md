# Deliverable description, as taken from Github issue #111 on 2019-08-27 {.notoc}

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** University of Kaiserslautern
- **Due:** 2019-08-31 (month 48)
- **Nature:** Demonstrator
- **Task:** T5.4 (#102)
- **Proposal:** [p. 51](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Upcoming report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.13/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.13/))

# Context
Singular is a computer algebra system aimed at computations in algebraic geometry and is one of the components used by Sage for computations with multivariate polynomials. The multivariate arithmetic currently in Singular is in need of improvement. Speeding up arithmetic operations in Singular will provide benefits to users of both Singular and Sage.

# Goal of the deliverable
The aim of this deliverable is to modernize the sparse multivariate arithmetic in Singular by 1) updating the algorithms to the state of the art and by 2) applying thread level parallelism to achieve decent scaling on multi-core machines. The operations we focus on are multiplication, divisibility testing, and the computation of the greatest common divisor.

