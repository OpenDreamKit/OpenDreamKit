# Deliverable description, as taken from Github issue #94 on 2017-02-28 {.notoc}

- **WP4:** [User Interfaces](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP4)
- **Lead Institution:** Université Paris-Sud
- **Due:** 2016-08-31 (month 12)
- **Nature:** Demonstrator
- **Tasks:** T4.1 (#69) Uniform notebook interface for all interactive components, T4.6 (#74) Structured documents
- **Proposal:** [p. 48](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP4/D4.5/report-final.pdf)**

The goal of this deliverable is to replace the old Sage Notebook server by the newer Jupyter server. This has two aspects: first of all, there needs to be an easy way to convert Sage notebooks to Jupyter. Second, the Jupyter notebook needs to have the same features that the Sage notebook had.

Since 2014, a lot of work was put into this by the SageMath community, and in particular Volker Braun. Recently, this work has been continued thanks to OpenDreamKit.

Done:
- [x] [#19877](https://trac.sagemath.org/ticket/19877): Conversion of legacy notebooks to Jupyter notebooks @vbraun, @videlec, @marcinofulus 
- [x] [#19740](https://trac.sagemath.org/ticket/19740) : Run `sagenb_export` by default
- [x] [#20690](http://trac.sagemath.org/ticket/20690), [#22458](http://trac.sagemath.org/ticket/22458): Live documentation @fcayre, @nthiery, @videlec 
- [ ] Interacts/widgets: full support and backward compatibility with the legacy SageNB [#21267](https://trac.sagemath.org/ticket/21267) (closed installation issues: [#21260](https://trac.sagemath.org/ticket/21260) [#21261](https://trac.sagemath.org/ticket/21261) [#20218](https://trac.sagemath.org/ticket/20218) [#21256](https://trac.sagemath.org/ticket/21256)) @jdemeyer

Future work:
- [ ] WYSIWYG editor for the markdown cells, such as [TinyMCE](https://www.tinymce.com/) (see [this post](https://groups.google.com/d/msg/sage-devel/t11JSxxCgpw/BR0Bt638AgAJ) for motivation)
- [ ] [#20316](https://trac.sagemath.org/ticket/20316): Add button to export SageNB notebooks to Jupyter
