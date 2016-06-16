# Deliverable description, as taken from Github issue's #107 on 2016-06-16

- **WP5:** [High Performance Mathematical Computing](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP5)
- **Lead Institution:** Université Paris-Sud
- **Due:** 2015-11-30 (month 3)
- **Submitted to Sage:** 2015-11-30
- **Merged into Sage:** 2016-04-08
- **Task**: T5.6 (#104)
- **Nature:** Demonstrator
- **Proposal:** [p.51](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/D5.1/D5.1-final-report.pdf)**

[MapReduce](https://en.wikipedia.org/wiki/MapReduce) is a classical programming model for distributed computations where one maps a function on a large data set and use a reduce function to summarize all the produced information. A use case that occurs often e.g. in combinatorics is to have a data sets that is described by a recursion tree, and is too big to be expanded in memory. Instances include counting the number of elements in the data set, or collecting some statistics on them.

A prototype distributed implementation of this programming model had been written in 2010-2014 for SageMath, using multiple processes on a single machine and work-stealing for load balancing. In this deliverable, we have turned this prototype into production code and integrated it into the SageMath distribution.

See [Trac Ticket 13580](http://trac.sagemath.org/ticket/13580) for the source code and the discussion about the integration into Sage, as well as this [snapshot of the documentation](https://github.com/OpenDreamKit/OpenDreamKit/blob/master/WP5/T5.6/documentation.pdf).

This work was presented at the [journée du groupe de travail LaMHA](http://tesson.julien.free.fr/LaMHA/2015/automne.php) at Université Pierre et Marie Curie on November the 26th of 2016. The [slides](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP5/T5.6/HPC-Combi.pdf) give an overview of the motivations, algorithm, and implementation.

