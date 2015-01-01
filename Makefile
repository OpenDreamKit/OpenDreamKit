# possibly customize the following variables to your setting
PROPOSAL = proposal.tex 		# the proposal
BIB = bibliography.bib	        # bibTeX databases
PROP.dir = LaTeX-proposal
###########################################################################
# the following are computed
TSIMP = 			                  # pdflatex Targets without bibTeX
TSIMP.pdf 	= $(TSIMP:%.tex=%.pdf)            # PDFs to be produced
TBIB = $(PROPOSAL) 		  	  	  # pdflatex Targets with bibTeX
TARGET = $(TSIMP) $(TBIB)                         # all pdflatex targets
TBIB.pdf 	= $(TBIB:%.tex=%.pdf)         	  # PDFs to be produced
TBIB.aux 	= $(TBIB:%.tex=%.aux)             # their aux files.
PDATA 		= $(PROPOSAL:%.tex=%.pdata)       # the proposal project data
SRC = $(filter-out $(TARGET),$(shell ls *.tex))   # included files
PDFLATEX = pdflatex -interaction scrollmode -file-line-error
BBL.base =# 1 2 3 4
BBL = $(PROPOSAL:%.tex=%.bbl) $(BBL.base:%=$(PROPOSAL:%.tex=%)%-blx.bbl)
PROPCLS.dir = $(PROP.dir)/base
PROPETC.dir = $(PROP.dir)/etc
EUPROPCLS.dir = $(PROP.dir)/eu
TEXINPUTS := .//:$(PROPCLS.dir)//:$(EUPROPCLS.dir)//:$(PROPETC.dir)//:
BIBINPUTS := ../lib:$(BIBINPUTS)
PROPCLS.clssty = proposal.cls pdata.sty
PROPETC.sty = workaddress.sty metakeys.sty sref.sty
EUPROPCLS.clssty = euproposal.cls
PROPCLS = $(PROPCLS.clssty:%=$(PROPCLS.dir)/%) $(EUPROPCLS.clssty:%=$(EUPROPCLS.dir)/%) $(PROPETC.sty:%=$(PROPETC.dir)/%)

all: $(TBIB.pdf) $(TSIMP.pdf)

cd: 	                                           # make cd will prepare CD for burning
	mkdir CD;make $(TARGET.pdf); cp $(TARGET.pdf) CD

bbl:	$(BBL)
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
	sort $(PROPOSAL:%.tex=%.delivs) > $(PROPOSAL:%.tex=%.deliverables)
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
	rm -f *.log *.blg *~ *.synctex.gz *.cut

distclean: clean
	rm -f *.aux *.out *.run.xml *.bbl *.toc *.deliv* *.pdata
	rm -Rf auto
	rm -f proposal.fls
echo:
	echo $(BBL)
