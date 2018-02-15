PREFIX = ../lib
PACKAGE = eu
TDSCOLL = proposal
DTX.cls.base = euproposal
DTX = euproposal.dtx
TDS.tex = eureporting.cls eupdata.sty

all: package doc
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;

include $(PREFIX)/Makefile.vars
TEXINPUTS = .:
include $(PREFIX)/Makefile.in

clean: clean-local
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;
distclean: distclean-local
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;

