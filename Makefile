TARGET = proposal
TARGETPDF = ${TARGET}.pdf
EXPORT = ../proposal-export

TEXFILES = ${TARGET}.tex  outline.tex resources.tex deliverables.tex milestones.tex preamble.tex participants.tex
WPFILES =  $(wildcard WorkPackages/*.tex)
STYLEFILES = $(wildcard *.sty)
BIBFILES = bibliography.bib
PDFFILES = 
PSFILES =
GRAPHICSFILES =
REVISION := $(shell git rev-parse --short HEAD)

# the latex build command. it is based on latexmk,
# set to produce PDFs (-pdf) and adding some parameters to work well
# with SMC via "-pdflatex=..."
# --shell-escape allows one to run python/bash code from within the
# document, which could be a security risk (but we trust each other ;-)
LATEX=latexmk
LATEXBUILDARGS=-pdf -pdflatex="pdflatex --interact=nonstopmode --shell-escape -synctex=1 %O %S"

SOURCES = ${TEXFILES} ${WPFILES} ${BIBFILES} ${PDFFILES} ${PSFILES}  ${GRAPHICSFILES} ${STYLEFILES}
COPIES = ${TEXFILES} ${BIBFILES} ${STYLEFILES} WPs Makefile

.PHONY=clean distclean all export show dist

# Only make pdf file by default (default is the first make rule)
all: $(TARGETPDF)

# make .pdf file from sources using pdflatex
#${TARGET}.pdf: ${SOURCES}
#	pdflatex ${TARGET}
#	bibtex ${TARGET}
#	pdflatex ${TARGET}
#	pdflatex ${TARGET}

proposal.pdf: Pictures/TheBigPicture.pdf

# the core build command, mapping tex -> pdf files
# with all SOURCES as dependencies
%.pdf: %.tex ${SOURCES}
	$(LATEX) $(LATEXBUILDARGS) $<

%.pdf: %.svg
	rsvg-convert -f pdf -o $@ $<

export: $(TARGETPDF)
	-mkdir ${EXPORT}
	-cp -a ${COPIES} Makefile ${EXPORT}

clean:
	$(LATEX) -c

# this cleans up more (uppercase -C) and also gets rid of
# auxillary files
distclean:
	$(LATEX) -C
	-$(RM) ${TARGET}.{pdf,aux,blg,toc,bbl,log,dvi,out}
	-$(RM) $(TARGET).synctex.gz

# xdg-open opens the default associated application in Linux
show:
	xdg-open $(TARGETPDF)

# continuous mode re-builds the PDF file when one of the
# dependency files are modified. This works great in conjunction
# with a PDF viewer, which reloads automatically the PDF on changes
# e.g. "evince" in Linux
cont:
	latexmk $(LATEXBUILDARGS) -pvc $(TARGET)

# target "dist" just copies the PDF and includes the GIT revision
dist: $(TARGETPDF)
	cp $(TARGETPDF) $(TARGET)-$(REVISION).pdf

TOWRITE: *.tex */*.tex
	grep TOWRITE *.tex */*.tex | perl -p -e 's/^(.*):.*TOWRITE\{(.*?)\}(.*)$$/$$2\t$$1: $$3/' - | grep -v XXX | sort > TOWRITE
