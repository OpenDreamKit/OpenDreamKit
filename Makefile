REVIEW_2016_06_DELIVERABLES=WP1/D1.1 WP1/D1.2 WP2/D2.1 WP3/D3.1 WP4/D4.1 WP4/D4.2 WP5/D5.1 WP6/D6.1
REVIEW_2016_06_REPORTS=$(REVIEW_2016_06_DELIVERABLES:%=%/report.pdf)
reports: $(REVIEW_2016_06_REPORTS)
reports.zip: $(REVIEW_2016_06_REPORTS)
	rm -rf /tmp/reports
	mkdir /tmp/reports
	for deliverable in $(REVIEW_2016_06_DELIVERABLES); do cp $$deliverable/report.pdf /tmp/reports/`basename $$deliverable`.pdf; done
	zip -r --junk-paths reports.zip /tmp/reports

ISSUE_WP1/D1.1=17
ISSUE_WP1/D1.2=18
ISSUE_WP2/D2.1=34
ISSUE_WP2/D2.2=42
ISSUE_WP3/D3.1=58
ISSUE_WP4/D4.1=83
ISSUE_WP4/D4.2=91
ISSUE_WP5/D5.1=107
ISSUE_WP6/D6.1=133

%/github-issue-description.md:
	(echo "# Deliverable description, as taken from Github issue's #$(ISSUE_$*) on `date -I` {-}\n"; get_issue_body $(ISSUE_$*)) > $@

%.tex: %.md
	sed -e 's/- \[[xX]\]/- $$\\checkmark$$/; s! \([^ ]*[a-z]\)#\([0-9][0-9]*\)! [\1#\2](https://github.com/\1/issues/\2)!g; s!\([^a-z]\)#\([0-9]*[0-9]\)!\1[#\2](https://github.com/OpenDreamKit/OpenDreamKit/issues/\2)!g;' $< | pandoc -f markdown_github+tex_math_dollars+header_attributes -t latex -o $@

%/report.pdf: %/report.tex %/github-issue-description.tex Proposal/LaTeX-proposal/deliverablereport.cls
	cd `dirname $<`; file=`basename $<`; pdflatex $$file; bibtex $$file; pdflatex $$file; pdflatex $$file

WP3/D3.1/report.pdf: WP3/D3.1/status-report.tex

.SECONDARY:

clean:
	-rm $(REVIEW_2016_06_DELIVERABLES:%=%/report.pdf)

real-clean: clean
	-rm $(REVIEW_2016_06_DELIVERABLES:%=%/github-issue-description.md)
	-rm $(REVIEW_2016_06_DELIVERABLES:%=%/github-issue-description.tex)


