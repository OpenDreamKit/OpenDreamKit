PREFIX = ../lib
PACKAGE = base
TDSCOLL = proposal
DTX.cls.base = proposal
TDS.tex = reporting.cls pdata.sty
CTAN = $(TDS.tex)
REDUNDANT = dcm.sty metakeys.sty sref.sty
all: package doc

include $(PREFIX)/Makefile.vars
TEXINPUTS = .:
include $(PREFIX)/Makefile.in

echo:	
	echo $(PACKAGEDATE)



