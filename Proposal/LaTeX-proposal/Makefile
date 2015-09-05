SRCDIRS 	= 
DOCDIRS 	= eu/examples dfg/examples
DTXDIRS 	= base eu
MAKEDIRS 	= $(DTXDIRS)
TDSCOLL 	?= $(shell basename $$PWD)
DISTDIRS	= $(DTXDIRS)
all clean distclean: 
	@for d in $(MAKEDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done

package doc filedate checksum enablechecksum disablechecksum: 
	@for d in $(DTXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done

GITURI = git@github.com:KWARC/LaTeX-proposal.git 
TDS.src = 
TDS.doc = README.md
TDS.src = 
include lib/Makefile.vars
include lib/Makefile.in
include lib/Makefile.ctan

echo:
	echo $(DISTDIRS)
