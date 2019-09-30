###########################################################################
# Automating proposal management by make.
# The participants work on proposal.tex in "draft" mode, which gives a lot
# of information to the developers. Variants submit.tex and public.tex are
# used to prepare official versions (hiding development/private info). 
###########################################################################
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
SRC = $(filter-out $(TARGET),$(shell ls *.tex */*.tex))   # included files
PDFLATEX = pdflatex -interaction scrollmode -file-line-error
BBL = $(PROPOSAL:%.tex=%.bbl)
PROPCLS.dir = $(PROP.dir)/base
PROPETC.dir = $(PROP.dir)/etc
EUPROPCLS.dir = $(PROP.dir)/eu
TEXINPUTS := .//:$(PROPCLS.dir)//:$(EUPROPCLS.dir)//:$(PROPETC.dir)//:
BIBINPUTS := ../lib:$(BIBINPUTS)
export TEXINPUTS
export BIBINPUTS
PROPCLS.clssty = proposal.cls pdata.sty
PROPETC.sty = workaddress.sty metakeys.sty sref.sty
EUPROPCLS.clssty = euproposal.cls
PROPCLS = $(PROPCLS.clssty:%=$(PROPCLS.dir)/%) $(EUPROPCLS.clssty:%=$(EUPROPCLS.dir)/%) $(PROPETC.sty:%=$(PROPETC.dir)/%)

all: $(TBIB.pdf) $(TSIMP.pdf)

final:
	$(MAKE) $(MAKEFAGS) -w PROPOSAL=final.tex all

final-split: final
	pdftk final.pdf cat 1-69   output final-123.pdf
	pdftk final.pdf cat 70-end output final-45.pdf

draft:  $(SRC)
	$(MAKE) $(MAKEFAGS) -w PROPOSAL=draft.tex all

grantagreement:
	$(MAKE) $(MAKEFAGS) -w PROPOSAL=grantagreement.tex -W grantagreement.tex all
	mv grantagreement.pdf grantagreement-full.pdf
	pdftk grantagreement-full.pdf cat 1-36 62-end output grantagreement.pdf

install: final
	cp final.pdf proposal-www.pdf
	git commit -m "Updated pdf" proposal-www.pdf
	git push

bbl:	$(BBL)
$(BBL): %.bbl: %.aux
	biber $*

#bibtex -min-crossrefs=100 -terse $<

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
	rm -f *~ *.log *.ilg *.out *.glo *.idx *.ilg *.blg *.run.xml *.synctex.gz *.cut *.toc

distclean: clean
	rm -f *.aux *.ind *.gls *.ps *.dvi *.thm *.out *.run.xml *.bbl *.toc *.deliv* *.pdata *-blx.bib
	rm -Rf auto
	rm -f proposal.fls
echo:
	echo $(BBL)

singlerun:
	pdflatex -file-line-error $(PROPOSAL)

TOWRITE: *.tex */*.tex
	fgrep 'TOWRITE{' *.tex */*.tex | perl -p -e 's/^(.*):.*TOWRITE\{(.*?)\}(.*)$$/$$2\t$$1: $$3/' - | grep -v XXX | sort > TOWRITE
#	git commit -m "Updated TOWRITE" TOWRITE
#	git push

TAGS: *.tex */*.tex
	etags *.tex */*.tex

# Proposal metadata in YAML format, in particular for the web page
final.pdata.yaml: final.pdata
	../bin/pdata-latex-to-yaml $< > $@

install-proposal-metadata: final.pdata.yaml
	cp $< ../WWW/_data/proposal.yml
	cd ../WWW/_data; git pull; git add proposal.yml; git commit -m "Updated proposal metadata" proposal.yml; git push

CollaborativeWritingOfTheOpenDreamKitProposal.mp4:
	gource -s .4 -1280x720 --auto-skip-seconds .4 --multi-sampling --stop-at-end --highlight-users --hide mouse,progress --file-idle-time 0 --max-files 80 --background-colour 111111 --font-size 20 --title "Collaborative writing of the OpenDreamKit European H2020 proposal" --output-ppm-stream - --output-framerate 60 | avconv -y -r 60 -f image2pipe -vcodec ppm -i - -b 8192K $@

proposal.html:
	latexmlc --includestyles --log proposal.ltxlog --destination $@ --path LaTeX-proposal/base --path LaTeX-proposal/eu proposal.tex 

allinone.tex:
	latexexpand final.tex -o $@

diff:	allinone.tex
	# in the old checkout
	# cd Proposal
	# latexexpand final.tex -o allinone-old.tex
	# copy the result to this directory
	-rm diff.*
	latexexpand final.tex -o allinone.tex
	latexdiff  allinone-old.tex allinone.tex > diff.tex
	sed -i   s/blue/DarkGreen/ diff.tex
	sed -i   "s/^.milestonetable/%milestonetable/" diff.tex
	make PROPOSAL=diff.tex all
	# Comment out the \milestonetable line
	# Change color from blue to DarkGreen in the preamble:
	# \providecommand{\DIFadd}[1]{{\protect\color{DarkGreen}\uwave{#1}}} %DIF PREAMBLE
	# make PROPOSAL=diff.tex all

	# To view the differences in the tables: use diffpdf, set pages as 31-36,38    vs 32-37,38  , export
