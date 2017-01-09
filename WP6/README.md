# WP6: Data/Knowledge/Software-Bases

Lead Institution: Jacobs University Bremen

- Objectives:

The ultimate purpose of a mathematical VRE is to create data (D; see Section 1.3.1), knowledge (K), and software (S)
by modeling world situations, computing mathematical objects, and running computational experiments. To be effective a
VRE needs an infrastructure that supports the creation, management, access, and dissemination of DKS-Structures. All
the systems considered in this proposal (GAP, SAGE, PARI, SINGULAR, OEIS, arXiv.org, . . . ) already include data,
knowledge, and software modules as part of their regular distribution, but not in a form that is interoperable between
systems, severely limiting the usefulness of the systems and results. The objectives of this work package are
1. to design metadata and representation formats for trans-system DKS structures as a basis for a math VRE,
2. implement interfaces to existing systems for interoperability and compatibility with the RE, and
3. implement a joint DKS infrastructure for, searches, documentation, traceability, versioning, provenance, visualisation
and native dissemination of OpenDreamKit results (the latter three together with WP4).
Concretely we will design and build an infrastructure that would make it easy for either individual mathematicians or a
distributed collaboration to manage and use such interlinked mathematical data. This work would provide part of the
backend to WP4, and would draw on previous work with the LMFDB and FINDSTAT (which will be treated as prototypes
for our purposes, to serve as exemplars to other projects) and in return will substantially enhance their capabilities.
User prerequisites should be kept to a minimum (depending on contributors’ and users’ needs and goals), and in
particular would not require any background in databases to contribute new data or perform queries.

- Description:

We need ways to represent DKS in the same representational system, make the DKS structures explicit and therefore
machine-manageable and – since current computational/experimental mathematics involve quite extensive DKS– we
need a new kind of “database”, which we will call Mathematical Data/Knowledge/Software-base (DKS base), and which
we will build in this work package.
The starting points for this unification effort will be the system-oriented data bases forD, the OMDoc (Open Mathematical
Documents) framework [17] for K. OMDoc/MMT [32] is a representation format for mathematical documents and knowledge
that incorporates a metalogical framework to be foundation-independent, which allows interoperability between
various ontologies/foundations of mathematics. For the integration of K and S we will build on the notion of biform theories
developed by Carette/Farmer [8] and extended to OMDoc/MMT by JacobsUni in [19]. In this setup, the programming
language serves as a foundation, just as ZFC set theory might for mathematical knowledge. Complex relationships
between mathematical objects, interpretations of the underlying languages, and unit transformations are modeled in a
graph of theories and theory morphisms.
The complexity of mathematical DKS structures is on vivid display in the L-functions and Modular Forms database
project (LMFDB): while the general shape of the functional equation of an L-function is dependent on a lot of theoretical
knowledge, it also requires parameter data and the coefficients of the associated Dirichlet series. Once this is obtained,
highly optimised (and heavily parallelizable) algorithms can be run to compute values of this function.

See page 53 of the [proposal](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf) for the full description.
