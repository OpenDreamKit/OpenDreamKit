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

kwarc.bib: extpubs.bib kwarcpubs.bib kwarccrossrefs.bib extcrossrefs.bib
	cat extpubs.bib kwarcpubs.bib kwarccrossrefs.bib extcrossrefs.bib> kwarc.bib
