PREFIX = ../lib
PACKAGE = eu
TDSCOLL = proposal
DTX.cls.base = euproposal
TDS.tex = eureporting.cls eupdata.sty
EXDIRS = examples

all: package doc
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;

include $(PREFIX)/Makefile.vars
TEXINPUTS = .:
include $(PREFIX)/Makefile.in

