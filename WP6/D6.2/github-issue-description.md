# Deliverable description, as taken from Github issue #136 on 2016-09-19 {.notoc}

- **WP6:** [Data/Knowledge/Software-Bases](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP6)
- **Lead Institution:** Jacobs University Bremen
- **Due:** 2016-08-31 (month 12)
- **Delivered:** 2016-09-12
- **Nature:** Report
- **Tasks:** T6.1 (#123), T6.3 (#125), T6.5 (#127)
- **Proposal:** [p.55](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP6/D6.2/report-final.pdf)**

The OpenDreamKit proposal had envisioned WP6: *Data/Knowledge/Software bases* as a foundational enterprise that would develop a knowledge-based architecture over the course of the project and would allow to re-engineer *ad-hoc* interfaces between systems (e.g. from T3.2 (#51)) on a more *semantic* basis -- the knowledge aspect (K). Consequently, the proposal envisioned concentrating the data (D) aspect on the mathematical knowledge bases (specifically LMFDB, OEIS, and FindStat) and proposed a host of foundational investigations of mathematical for the software (S) aspect with applications e.g. in the verification of algorithms.

Already the kickoff meeting in Paris in September 2015 revealed that the D/K/S aspects are much more tightly coupled in systems than anticipated. This was confirmed by the DKS survey conducted subsequently. In particular, the participants of WP6 identified the interoperability of OpenDreamKit systems to be one of the most critical steps in creating a VRE toolkit. Thus we prioritized tasks T6.1 (#123), T6.2 (#124), T6.3 (#125) and organized a series of workshops and code-maratons to develop a semantic foundation for system interoperability and simultaneously test it in implementations.

As a consequence, we have completed the initial design of D/K/S-bases (for this deliverable) in parallel with the initial implementation of a DKS base format based on OMDoc/MMT and the implementation of a DKS base system itself based on the MMT system (both for D6.3 (#137)), all activities fuelling each other. D6.3 (#137) was thus completed about three months ahead of schedule.  Note that the RNC schema envisioned in the title proved un-necessary since, with the refined Math-in-the-Middle (MitM) design, the normal OMDoc/MMT schema is sufficient.  Due to the resulting tight coupling between this deliverable and D6.3 (#137), and for the convenience of the reader, we have decided to report on both deliverables together.

In this report we therefore present the design process towards *DKS*-theories including the overall architecture (for this deliverable), a survey of the systems involved (for D6.3 (#137)), our current implementation (for D6.3 (#137)) as well as our plans for the future. Each part is labeled by the deliverable they contribute to mainly.

