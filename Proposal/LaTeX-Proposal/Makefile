########################################################################
# This Makefile automates maintenance and CTAN submission of complex
# LaTeX packages. 
########################################################################

MAKEDIRS 	= $(DTXDIRS)
TDSCOLL 	?= $(shell basename $$PWD)
DISTDIRS	= $(DTXDIRS)
TDS.README 	= README.ctan

# targets for repository maintenance
all clean distclean: 
	@for d in $(MAKEDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done
package doc:
	@for d in $(DTXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done

########################################################################
# CTAN submission
########################################################################
# Directories that should be copied into top-level directories
# - source (the *.dtx and *.ins files),
# - doc    (package/class documentation), and 
# - tex    (*.sty and *.cls, etc that LaTeX reads)
# of the CTAN and TDS submissions
SRCDIRS 	= bin lib
DOCDIRS 	= #eu/examples/strep dfg/examples/proposal 
DTXDIRS 	= base dfg eu

# targets for CTAN. 
filedate checksum enablechecksum disablechecksum: 
	@for d in $(DTXDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done

GITURI = git@github.com:KWARC/LaTeX-proposal.git 
TDS.src = 
TDS.src =
TDS.readme = README.ctan
include lib/Makefile.ctan
