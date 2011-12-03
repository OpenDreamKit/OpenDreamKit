BST = alpha apalike
BSTINPUTS = /usr/local/texlive/2008/texmf-dist/bibtex/bst/base/
HURL = $(BST:%=%hurl.bst)
URLH = $(BST:%=%urlh.bst)

all: kwarc.bib
bst: $(HURL) $(URLH)

$(HURL): %hurl.bst: $(BSTINPUTS)/%.bst
	urlbst --inlinelinks --hyperref $< > $@

$(URLH): %urlh.bst: $(BSTINPUTS)/%.bst
	urlbst --hyperref $< > $@

## This is dangerous.  In the current state it will result in a broken output file.
## Disabled.  --Christoph, 2011-12-04
# kwarc.bib: kwarcext.bib kwarcpubs.bib
# 	cat kwarcext.bib kwarcpubs.bib > kwarc.bib
