PREFIX = .
DIRS = editions standards workshops books incollections proceedings techreports articles conferences software theses

SRC = $(PREFIX)/../kwarc.bib $(PREFIX)/*.tex $(PREFIX)/*/*.tex $(PREFIX)/*/*/*.tex

all:    all-here
	@for d in $(DIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done

all-here: $(SRC)
	pdflatex all
	bibtex all
	pdflatex all
