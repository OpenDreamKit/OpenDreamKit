PREFIX = ../lib
PACKAGE = base
TDSCOLL = proposal
DTX.cls.base = proposal
DTX = proposal.dtx
TDS.tex = reporting.cls pdata.sty
CTAN = $(TDS.tex)
REDUNDANT = dcm.sty metakeys.sty sref.sty
all: package doc

include $(PREFIX)/Makefile.vars
TEXINPUTS = .:
include $(PREFIX)/Makefile.in

clean: clean-local
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;
distclean: distclean-local
	@for d in $(EXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;

echo:	
	echo $(PACKAGEDATE)



