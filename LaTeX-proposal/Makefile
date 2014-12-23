SRCDIRS 	= 
DOCDIRS 	= eu/examples dfg/examples
DTXDIRS 	= base dfg eu
MAKEDIRS 	= $(DTXDIRS)
TDSCOLL 	?= $(shell basename $$PWD)
DISTDIRS	= $(DTXDIRS)
all clean distclean: 
	@for d in $(MAKEDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done

package doc filedate checksum enablechecksum disablechecksum: 
	@for d in $(DTXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done

TDSURL = https://svn.kwarc.info/repos/kwarc/doc/macros/forCTAN/proposal
TDS.src = 
TDS.doc = README
TDS.src = 

include lib/Makefile.ctan

echo:
	echo $(DISTDIRS)
