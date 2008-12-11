# Michael, I had to comment this, as make still complained about your BIB path not
# being available on strawberry.
# 
# Christoph, 2008/11/10
# 
# alphahurl.bst: $(BIB)
#       urlbst --inlinelinks --hyperref $< > $@

kwarc.xml: kwarc.bib 
	 latexml --destination=kwarc.xml kwarc.bib
