# possibly customize the following variables to your setting
REPORT = finalreport.tex 	# the report
BIB = ../lib/dummy.bib	        # bibTeX databases
PROP.dir = ../../..
###########################################################################
# the following are computed
#CVP = $(shell ls CV_PubList*.tex)                # CVs of the proposers
#TSIMP = letter_submission.tex	                  # pdflatex Targets without bibTeX
#TSIMP.pdf 	= $(TSIMP:%.tex=%.pdf)            # PDFs to be produced
TBIB = $(REPORT) #$(CVP)		  	  # pdflatex Targets with bibTeX
TARGET = $(TSIMP) $(TBIB)                         # all pdflatex targets
TBIB.pdf 	= $(TBIB:%.tex=%.pdf)         	  # PDFs to be produced
TBIB.aux 	= $(TBIB:%.tex=%.aux)             # their aux files.
PDATA 		= $(REPORT:%.tex=%.pdata)       # the proposal project data
SRC = $(filter-out $(TARGET),$(shell ls *.tex))   # included files
PDFLATEX = pdflatex -interaction batchmode -file-line-error
BBL = $(REPORT:%.tex=%.bbl)
PROPCLS.dir = $(PROP.dir)/base
PROPETC.dir = $(PROP.dir)/etc
DFGPROPCLS.dir = $(PROP.dir)/dfg
TEXINPUTS := .//:$(PROPCLS.dir)//:$(DFGPROPCLS.dir)//:$(PROPETC.dir)//:
BIBINPUTS := ../lib:$(BIBINPUTS)
PROPCLS.clssty = reporting.cls pdata.sty
PROPETC.sty = workaddress.sty metakeys.sty sref.sty
DFGPROPCLS.clssty = dfgreporting.cls dfgpdata.sty
PROPCLS = $(PROPCLS.clssty:%=$(PROPCLS.dir)/%) $(DFGPROPCLS.clssty:%=$(DFGPROPCLS.dir)/%) $(PROPETC.sty:%=$(PROPETC.dir)/%)

all: $(TBIB.pdf) $(TSIMP.pdf)

cd: 	                                           # make cd will prepare CD for burning
	mkdir CD;make $(TARGET.pdf); cp $(TARGET.pdf) CD

$(BBL): %.bbl: %.aux
	bibtex -min-crossrefs=100 -terse $<

$(TSIMP.pdf): %.pdf: %.tex $(PROPCLS) $(PDATA)
	$(PDFLATEX) $< || $(RM) $@

$(PDATA): %.pdata: %.tex
	$(PDFLATEX) $<

$(TBIB.aux): %.aux: %.tex
	$(PDFLATEX) $<

$(TBIB.pdf): %.pdf: %.tex $(SRC) $(BIB) $(PROPCLS) 
	$(PDFLATEX) $<  || $(RM) $@
#	sort $(REPORT:%.tex=%.delivs) > $(REPORT:%.tex=%.deliverables)
	@if (test -e $(patsubst %.tex, %.idx,  $<));\
	    then makeindex $(patsubst %.tex, %.idx,  $<); fi
	$(MAKE) -$(MAKEFLAGS) $(BBL)
	@if (grep "(re)run BibTeX" $(patsubst %.tex, %.log,  $<)> /dev/null);\
	    then $(MAKE) -B $(BBL); fi
	$(PDFLATEX)  $< || $(RM) $@
	@if (grep Rerun $(patsubst %.tex, %.log,  $<) > /dev/null);\
	   then $(PDFLATEX)  $<  || $(RM) $@; fi
	@if (grep Rerun $(patsubst %.tex, %.log,  $<) > /dev/null);\
	    then $(PDFLATEX)  $<  || $(RM) $@; fi

clean: 
	rm -f *~ *.log *.ilg *.out *.glo *.idx *.ilg *.blg *.run.xml *.synctex.gz *.cut

distclean: clean
	rm -f *.aux *.ind *.gls *.ps *.dvi *.thm *.out *.run.xml *.bbl *.toc *.deliv* *.pdata *-blx.bib
	rm -Rf auto

echo:
	echo $(BIBINPUTS)
