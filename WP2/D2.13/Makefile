report.pdf: report.tex
	pdflatex report.tex
	bibtex report.aux
	pdflatex report.tex
	pdflatex report.tex

# can use this to force update of table of contents
force:
	pdflatex report.tex
	bibtex report.aux
	pdflatex report.tex
	pdflatex report.tex
clean:
	rm -f *~
	rm -f *.aux
	rm -f *.log
	rm -f *.toc
	rm -f *.xml
	rm -f *.out
	rm -f report.pdf
