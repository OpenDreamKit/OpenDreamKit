# Deliverable description, as taken from Github issue #39 on 2019-08-31 {.notoc}

- **WP2:** [Community Building, Training, Dissemination, Exploitation, and Outreach](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP2)
- **Lead Institution:** University of Silesia
- **Due:** 2019-07-31 (month 47)
- **Nature:** Demonstrator
- **Task:** T2.9 (#32) *Demonstrators:interactive text books*
- **Proposal:** [p. 38](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP2/D2.14/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP2/D2.14/))

Interactive tools have always been an attractive tool in education, engaging the student to learn both by theory and by practice, to immediately test their understanding, and to explore around the material, all at their own pace.

In Task~T2.9, we explored different approaches to authoring and distributing interactive textbooks using the Jupyter toolkit. In D2.9 (#49)  we reported on the writing of two interactive books. There, the books were authored as structured text files in the ReST document format, and exported as interactive html pages or pdf, using the `Sphinx` documentation system and the `sage-cell` interactive html page technology.

For this deliverable, we proceeded with two additional interactive textbooks:
- Problems in Physics
  https://github.com/marcinofulus/Mechanics_with_SageMath
  https://github.com/marcinofulus/Dynamical_Systems
  https://github.com/marcinofulus/Transport_Processes
- *Introduction to Python Computational Science and Engineering*
  https://github.com/fangohr/introduction-to-python-for-computational-science-and-engineering

There we explored an alternative approach: the books were authored as collections of Jupyter notebooks, and exported as notebooks, html or pdf.

In this report, we set the stage by describing the benefits of (Jupyter-based) interactive textbooks from the learners and authors perspective, and review our two new interactive text books; we then discuss the workflows we explored, their relative merits, and some best practices to enhance quality and maintenability. We present a template abstracted away from our books that enables new authors to kick-start the writing of their own book. We conclude by highlighting the ease of distribution of interactive textbooks thanks to the Binder Virtual Environment. The table of contents of the two books is provided in the appendix.

Altogether, this demonstrates that the OpenDreamKit efforts, notably T4.1 (#69), T4.3 (#71), T4.6 (#74), and T4.8 (#76) contributed to lower barriers for including computations in science education while significantly improving the maintainability of such interactive materials by proper use of automated validation.
