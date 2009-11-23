SRC = ../kwarc.bib *.tex */*.tex */*/*.tex
DIRS = articles	conferences software editions standards	theses books incollections proceedings techreports workshops

all:  $(SRC)
	pdflatex all;bibtex all;pdflatex all;pdflatex all
	@for d in $(DIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done
