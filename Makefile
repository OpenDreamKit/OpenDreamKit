# Michael, I had to comment this, as make still complained about your BIB path not
# being available on strawberry.
# 
# Christoph, 2008/11/10
# 
# alphahurl.bst: $(BIB)
#       urlbst --inlinelinks --hyperref $< > $@

all:	kwarc.xml

kwarc.tex.xml: kwarc.bib 
	 latexml --preload=url.sty --destination=kwarc.xml kwarc.bib

kwarc.xml: kwarc.tex.xml
	 latexmlpost --destination=kwarc.xml kwarc.xml
