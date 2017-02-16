# Deliverable description, as taken from Github issue #117 on 2017-02-10 {.notoc}

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** Logilab
- **Originally due:** 2016-08-31 (month 12)
- **Nature:** Demonstrator
- **Task:** T5.7 (#105)
- **Proposal:** [p.51](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.4/report-final.pdf)**

Pythran is a Python to C++ compiler for a subset of the Python language, with a focus on scientific computing, which takes advantage of multi-cores and SIMD instruction units. Given the importance of Python in the OpenDreamKit ecosystem, Pythran is one of the promising building blocks for high performance mathematical computing.

This deliverable is about enhancing the Pythran compiler to provide better user feedback when a type error is meet, by extracting and taking advantage of fine grain type information. The optimizations developed in this context are a more accurate version of identifier binding that increases the scope of Pythran valid input. Second, an unsound type checker has been developed and integrated in the 0.8 version of the Pythran compiler. It provides usable, meaningful feedback to users in case of type error, instead of internal compiler errors. These two steps make it easier to write computation-intensive kernels to be compiled by Pythran.
