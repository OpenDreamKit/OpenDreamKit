PREFIX = ..
SRC = $(PREFIX)/../kwarc.bib $(PREFIX)/*.tex $(PREFIX)/*/*.tex $(PREFIX)/*/*/*.tex

all: $(SRC)
	pdflatex all
	bibtex all
	pdflatex all
	pdflatex all
