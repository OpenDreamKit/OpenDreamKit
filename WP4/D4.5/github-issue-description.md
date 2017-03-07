# Deliverable description, as taken from Github issue #94 on 2017-02-28 {.notoc}

- **WP4:** [User Interfaces](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP4)
- **Lead Institution:** Université Paris-Sud
- **Due:** 2016-08-31 (month 12)
- **Nature:** Demonstrator
- **Tasks:** T4.1 (#69): Uniform notebook interface for all interactive components, T4.6 (#74) Structured documents
- **Proposal:** [p. 48](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP4/D4.5/report-final.pdf)**

The [Jupyter Notebook](https://jupyter.org) is a web application that enables the creation and sharing of executable documents which contain live code, equations, visualizations and explanatory text. Thanks to a modular design, Jupyter can be used with any computational system that provides a so-called [_Jupyter kernel_](https://jupyter.readthedocs.io/en/latest/projects/kernels.html) implementing the [_Jupyter messaging protocol_](https://jupyter-client.readthedocs.io/en/latest/) to communicate with the notebook. OpenDreamKit therefore promotes the Jupyter notebook as user interface of choice, in particular since it is particularly suitable for building modular web based Virtual Research Environments.

A notebook interface is such a vital integrative component that, predating Jupyter, the open source mathematical system SageMath had developed as early as 2005 its own solution, which we refer to here as the legacy SageMath notebook. Development was fast tracked to ensure its availability to allow the project to move forward, and it served as major source of inspiration for Jupyter.  Meanwhile, moving at a fast pace thanks to its much larger community, Jupyter had, by 2014, basically caught up with the legacy SageMath notebook in terms of functionality. 

Building on top of D4.4 (#93): Basic Jupyter interface for GAP, PARI/GP, SageMath, Singular, the goal of this deliverable was therefore to help phase out the legacy SageMath notebook in favour of Jupyter. Outsourcing this key but non disciplinary component is an important step toward the sustainability of ODK's ecosystem (Objective 5).

Since 2014, a lot of work was put into this by the SageMath community, and in particular by Volker Braun. Recently, this work has been continued thanks to ODK. It included two aspects: ensuring that Jupyter included all important features of the legacy SageMath notebook, and enabling a smooth migration path for users:
- [x] [#20690](http://trac.sagemath.org/ticket/20690), [#22458](http://trac.sagemath.org/ticket/22458): Live documentation @fcayre, @nthiery, @videlec 
- [ ] Interacts/widgets: full support and backward compatibility with the legacy SageNB [#21267](https://trac.sagemath.org/ticket/21267) (closed installation issues: [#21260](https://trac.sagemath.org/ticket/21260) [#21261](https://trac.sagemath.org/ticket/21261) [#20218](https://trac.sagemath.org/ticket/20218) [#21256](https://trac.sagemath.org/ticket/21256)) @jdemeyer
- [x] [#19877](https://trac.sagemath.org/ticket/19877): Conversion of legacy notebooks to Jupyter notebooks @vbraun, @videlec, @marcinofulus
- [x] [#19740](https://trac.sagemath.org/ticket/19740): Migration wizard, as a web application

Future work:
- [ ] WYSIWYG editor for the markdown cells, such as [TinyMCE](https://www.tinymce.com/) (see [this post](https://groups.google.com/d/msg/sage-devel/t11JSxxCgpw/BR0Bt638AgAJ) for motivation)
- [ ] [#20316](https://trac.sagemath.org/ticket/20316): Add button to export SageNB notebooks to Jupyter
