report.pdf: report.tex
	pdflatex report.tex
	bibtex report
	pdflatex report.tex
	pdflatex report.tex

clean:
	rm -f *~
	rm -f *.aux
	rm -f *.log
	rm -f *.toc
	rm -f *.xml
	rm -f *.out
	rm -f *.bib
	rm -f report.pdf
