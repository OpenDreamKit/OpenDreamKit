all: HPC-Combi.pdf

%.pdf: %.fig
	fig2dev -L pdf $< $@
HPC-Combi.pdf: HPC-Combi.tex scheme.pdf mindmap.pdf beamercolorthemeODK.sty beamerthemeTALK.sty
	pdflatex -synctex=1 -shell-escape $<
	pdflatex -synctex=1 -shell-escape $<
