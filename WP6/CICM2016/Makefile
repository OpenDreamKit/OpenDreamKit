SOURCES=concl.tex gap-sage.tex intro.tex paper.tex presenting-lmfdb.tex  tikzlibrarymmt.code.tex mitm.tex odk.tex pgflibrarytikzmmt.code.tex

FIGURES=tikz/*.tex examples/* *.png

arxiv::
	-rm -rf arxiv
	mkdir arxiv
	cp --parents $(FIGURES) paper.bbl llncs.cls odksystems.sty lststex.sty arxiv
	for source in $(SOURCES); do ./strip-for-arxiv $$source > arxiv/$$source; done

arxiv.tgz: arxiv
	tar zcvf $@ $<
