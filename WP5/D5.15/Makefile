IMAGE_NAMES=gap-core-tests gap-docker gap-package-tests gap-releases unipoly-notebook gap-docker-master-testsuite gap-infra-travis gap-packages-codecov hpcgap-speedups unipoly-repo gap-docker-pkg-tests gap-package-releases gap-packages-travis unipoly-files unipoly-slide

IMAGES=$(IMAGE_NAMES %=images/%.png)

report.pdf: report.tex report.bib $(IMAGES) deliverablereport.cls \
	eudelivreport.cls core-gap.tex intro.tex gap-infra.tex \
	github-issue-description.tex packages.tex package-tools.tex repro-gap.tex
	pdflatex report
	bibtex report
	pdflatex report
	pdflatex report

clean:
	rm -f report.pdf *.aux *.bbl *.blg *-blx.bib *.log *.out *.toc *.xml 
