PREFIX = ../lib
PACKAGE = dfg
TDSCOLL = proposal
DTX.cls.base = dfgproposal
DTX = dfgproposal.dtx
TDS.tex = dfgreporting.cls dfgpdata.sty
CTAN = $(TDS.tex)

all: package doc
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;

include $(PREFIX)/Makefile.vars
TEXINPUTS = .:
include $(PREFIX)/Makefile.in

clean: clean-local
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;
distclean: distclean-local
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;




