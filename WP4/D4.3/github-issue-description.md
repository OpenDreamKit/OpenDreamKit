# Deliverable description, as taken from Github issue #92 on 2017-02-28 {.notoc}

- **WP4:** [User Interfaces](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP4)
- **Lead Institution:** Friedrich-Alexander Universität Erlangen/Nürnberg (FAU), formerly Jacobs Universität Bremen
- **Due:** 2017-02-28 (Month 18)
- **Nature:** Demonstrator
- **Task:** T4.7 (#75): Active Documents Portal, T4.8 (#76): Visualisation system for 3D data in web-notebook
- **Proposal:** [p. 48](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- [**Final report**](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP4/D4.3/report-final.pdf)

One of the most prominent features of a virtual research environment (VRE) is a unified user interface. The OpenDreamKit approach is to create a mathematical VRE by integrating various pre-existing mathematical software systems. There are two approaches that can serve as a basis for the OpenDreamKit UI: ```computational notebooks``` and ```active documents```. The former allows for mathematical text around the computation cells of a real-eval-print loop of a mathematical software system and the latter makes semantically annotated documents active.

MathHub is a portal for active mathematical documents ranging from formal libraries of theorem provers to informal – but rigorous – mathematical documents lightly marked up by preserving LaTeX markup. In the OpenDreamKit project MathHub acts as:

* A portal and management system for theory-graph structured active documents, i.e. documents that use the semantic structure of the document and the knowledge context it links to to render semantic services embedded in the document – it becomes active, i.e. interactive, reactive - see D4.2 (#91).

* The repository for the Math-in-the-Middle (MitM) ontology, see D6.2 (#136). This ontology is used as a basis for interoperability of the mathematical software systems that make up the OpenDreamKit VRE toolkit, which is a crucial concern for work package [WP6](https://github.com/OpenDreamKit//OpenDreamKit/tree/master/WP6).

As the authoring, maintenance, and curation of theory-structured mathematical ontologies and the transfer of mathematical knowledge via active documents are an important part of the OpenDreamKit VRE toolkit, the editing facilities in MathHub play a great role for the project.

This report discusses the main design decisions of the editing facilities in MathHub; they can be assessed at http://mathhub.info.

