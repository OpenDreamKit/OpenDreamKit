REVIEW_2016_06_DELIVERABLES=WP1/D1.1 WP1/D1.2 WP2/D2.1 WP3/D3.1 WP4/D4.1 WP4/D4.2 WP5/D5.1 WP6/D6.1
REVIEW_2017_03_DELIVERABLES=WP1/D1.3 WP1/D1.4 WP2/D2.2 WP2/D2.3 WP2/D2.4 WP3/D3.2 WP3/D3.3 WP4/D4.3 WP4/D4.4 WP4/D4.5 WP4/D4.6 WP4/D4.8 WP4/D4.9 WP5/D5.2 WP5/D5.3 WP5/D5.4 WP5/D5.5 WP5/D5.6 WP5/D5.7 WP6/D6.2 WP6/D6.3 WP7/D7.1
DELIVERABLES=$(REVIEW_2016_06_DELIVERABLES) $(REVIEW_2017_03_DELIVERABLES)
REPORTS=$(DELIVERABLES:%=%/report.pdf)
GITHUBISSUEDESCRIPTIONS= $(DELIVERABLES:%=%/github-issue-description.md)

reports: $(REPORTS)
reports.zip: $(REPORTS)
	rm -rf /tmp/reports
	mkdir /tmp/reports
	for deliverable in $(REPORTS); do cp $$deliverable/report.pdf /tmp/reports/`basename $$deliverable`.pdf; done
	zip -r --junk-paths reports.zip /tmp/reports

WP%/deliverablereport.cls: Proposal/deliverablereport.cls
	cp $< $@
WP%/eudelivreport.cls: Proposal/LaTeX-proposal/eu/eudelivreport.cls
	cp $< $@

# Requires PyGithub, PyYAML
%/github-issue-description.md:
	(issue=`python3 bin/get_issue $*/report.tex`; echo "# Deliverable description, as taken from Github issue #$$issue on `date -I` {.notoc}\n"; python3 bin/get_issue_body $$issue) > $@

# For some pandoc does not support both options {.notoc .unumbered}. So we force the section to be a section* ...
%.tex: %.md
	sed -e 's/- \[[xX]\]/- $$\\checkmark$$/; s! \([^ ]*[a-z]\)#\([0-9][0-9]*\)! [\1#\2](https://github.com/\1/issues/\2)!g; s!\([^a-z]\)#\([0-9]\{1,3\}\)\([^0-9]\)!\1[#\2](https://github.com/OpenDreamKit/OpenDreamKit/issues/\2)\3!g;' $< | pandoc --toc-depth=1 -f markdown_github+tex_math_dollars+header_attributes -t latex | sed -e 's/\\section/\\section*/' > $@

WP%/report.pdf: WP%/report.tex WP%/github-issue-description.tex WP%/deliverablereport.cls WP%/eudelivreport.cls
	cd `dirname $<`; file=`basename -s .tex $<`; pdflatex $$file && bibtex $$file; pdflatex $$file && pdflatex $$file

WP3/D3.1/report.pdf: WP3/D3.1/status-report.tex

WP4/D4.4/report.pdf: WP4/D4.4/*.png

WP4/D4.5/report.pdf: WP4/D4.5/*.png


.SECONDARY:

clean:
	-rm $(REVIEW_2016_06_DELIVERABLES:%=%/report.pdf)

real-clean: clean
	-rm $(GITHUBISSUEDESCRIPTIONS)
	-rm $(DELIVERABLES:%=%/github-issue-description.tex)

update-github-issue-description: $(DELIVERABLES:%=%/github-issue-description.md)

