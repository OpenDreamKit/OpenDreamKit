# Deliverable description, as taken from Github issue #134 on 2019-08-31 {.notoc}

- **WP6:** [Data/Knowledge/Software-Bases](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP6)
- **Lead Institution:** FAU
- **Due:** 2019-08-31 (month 48; postponed from M42 in the last amendment)
- **Nature:** Other
- **Task:** T6.10 (#132), T6.11 (#286)
- **Proposal:** [p.54](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP6/D6.10/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP6/D6.10/))
 
This report summarizes the achievements in Work Package 6 over the last year of the OpenDreamKit project. Namely it covers results of **T6.10**: Math Search Engine and **T6.11**: Isabelle Case Study and tasks **T6.6**-**6.8** (case studies in mathematical data sets).

In the last year, significant progress has been made in four areas: 
-  the understanding of D/K/S-bases: we have codified the experiences in the OpenDreamKit project into a tetrapodal view on "doing mathematics", which extends the Data/Knowledge/Software model of the proposal by "narration" and  "organization" aspects.
-  the Knowledge (K) aspect, where we have developed an exporter from library the Isabelle Theorem prover (Archive of Formal Proof) to an extensive RDF triple store, which can be queried by standard SPARQL queries for semantic search.
- the data (D) aspect, where we have
  * developed both an innovative model of (deep) FAIR in mathematics (and have integrated it with the MitM paradigm developed in OpenDreamKit),
  * have implemented in a prototypical system (data.mathhub), and have
  * evaluated it on the mathematical community outside the core OpenDreamKit community.
- computational mathematical documents (the S aspect of D/K/S or the "narration" and "computation" aspects of the finer tetrapod model). Here we have developed a formula harvester for jupyter notebooks and a formula search engine that builds on them (as envisioned in task T10 of WP6). 

Note: The title of this deliverable was originally entitled *Full-text search (Formulae +  Keywords) in OpenDreamKit*. However, in the last grant agreement amendment, the scope was broadened to a report on the remaining **WP6** activities and achievements -- also to account for the new task **T6.11**. The title was changed to better reflect the actual content which, beyond Full-text search, targets the integration of mathematical data in Virtual Research Environments.
