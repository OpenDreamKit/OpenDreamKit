# Deliverable description, as taken from Github issue #114 on 2019-08-24 {.notoc}

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** CNRS
- **Due:** 2019-08-31 (month 48)
- **Nature:** Demonstrator
- **Task:** T5.1 (#99) 
- **Proposal:** [p. 51](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.16/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.16/))

We report on the work carried out during the OpenDreamKit project on the PARI number theory software to improve the support for parallel compuptation on a variety of hardware. This entailed devising a generic parallelisation engine for PARI, and using it to prototype selected functions (integer factorisation, discrete logarithm, modular polynomials). And then releasing a PARI suite (libpari, GP, and GP2C) that fully support parallelisation allowing individual implementations to scale gracefully between single core / multicore / massively parallel machines.
