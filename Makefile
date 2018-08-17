REVIEW_2016_06_DELIVERABLES=WP1/D1.1 WP1/D1.2 WP2/D2.1 WP3/D3.1 WP4/D4.1 WP4/D4.2 WP5/D5.1 WP6/D6.1
REVIEW_2017_03_DELIVERABLES=WP1/D1.3 WP1/D1.4 WP2/D2.2 WP2/D2.3 WP2/D2.4 WP3/D3.2 WP3/D3.3 WP4/D4.3 WP4/D4.4 WP4/D4.5 WP4/D4.6 WP4/D4.8 WP4/D4.9 WP5/D5.2 WP5/D5.3 WP5/D5.4 WP5/D5.5 WP5/D5.6 WP5/D5.7 WP6/D6.2 WP6/D6.3 WP7/D7.1
REVIEW_2018_10_DELIVERABLES=WP2/D2.7 WP2/D2.9 WP2/D2.11 WP3/D3.7 WP4/D4.7 WP4/D4.11 WP6/D6.5
DELIVERABLES=$(REVIEW_2016_06_DELIVERABLES) $(REVIEW_2017_03_DELIVERABLES) \
			 $(REVIEW_2018_10_DELIVERABLES)
REPORTS=$(DELIVERABLES:%=%/report.pdf) ReportingPeriod_1/Technical_Report/report.pdf
GITHUBISSUEDESCRIPTIONS= $(DELIVERABLES:%=%/github-issue-description.md)

reports: $(REPORTS)
reports.zip: $(REPORTS)
	rm -rf /tmp/reports
	mkdir /tmp/reports
	for report in $(REPORTS); do echo $$report; cp $$report /tmp/reports/`basename \`dirname $$report\``.pdf; done
	zip -r --junk-paths reports.zip /tmp/reports

WP%/report.tex:
	mkdir -p `dirname $@`
	bin/make_report_template $* > $@
WP%/deliverablereport.cls: Proposal/deliverablereport.cls
	cp $< $@
WP%/eudelivreport.cls: Proposal/LaTeX-proposal/eu/eudelivreport.cls
	cp $< $@

R%/deliverablereport.cls: Proposal/deliverablereport.cls
	cp $< $@
R%/eudelivreport.cls: Proposal/LaTeX-proposal/eu/eudelivreport.cls
	cp $< $@

# Requires PyGithub, PyYAML
%/github-issue-description.md:
	(issue=`python3 bin/get_issue $*/report.tex`; echo "# Deliverable description, as taken from Github issue #$$issue on `date -I` {.notoc}\n"; python3 bin/get_issue_body $$issue) > $@

%.tex: %.md
	sed -e 's/- \[[xX]\]/- $$\\checkmark$$/; s! \([^ ]*[a-z]\)#\([0-9][0-9]*\)! [\1#\2](https://github.com/\1/issues/\2)!g; s!\([^a-z]\)#\([0-9]\{1,3\}\)\([^0-9]\)!\1[#\2](https://github.com/OpenDreamKit/OpenDreamKit/issues/\2)\3!g;' $< | pandoc --toc-depth=1 -f markdown_github+tex_math_dollars+header_attributes+footnotes-hard_line_breaks -t latex > $@


# For some, pandoc does not support both options {.notoc .unumbered}. So we force the section to be a section* ...
%/github-issue-description.tex: %/github-issue-description.md
	sed -e 's/- \[[xX]\]/- $$\\checkmark$$/; s! \([^ ]*[a-z]\)#\([0-9][0-9]*\)! [\1#\2](https://github.com/\1/issues/\2)!g; s!\([^a-z]\)#\([0-9]\{1,3\}\)\([^0-9]\)!\1[#\2](https://github.com/OpenDreamKit/OpenDreamKit/issues/\2)\3!g;' $< | pandoc --toc-depth=1 -f markdown_github+tex_math_dollars+header_attributes+footnotes-hard_line_breaks -t latex | sed -e 's/\\section/\\section*/' > $@

%/report.pdf: %/report.tex %/deliverablereport.cls %/eudelivreport.cls
	cd `dirname $<`; file=`basename -s .tex $<`; pdflatex $$file && bibtex $$file; pdflatex $$file && pdflatex $$file

WP%/report.pdf: WP%/github-issue-description.tex

WP2/D2.7/report.pdf: WP2/D2.7/status-report.tex

WP3/D3.1/report.pdf: WP3/D3.1/status-report.tex

WP3/D3.5/report.pdf: WP3/D3.5/status-report.tex

WP3/D3.7/report.pdf: WP3/D3.7/status-report.tex

WP4/D4.4/report.pdf: WP4/D4.4/*.png

WP4/D4.5/report.pdf: WP4/D4.5/*.png

WP4/D4.7/report.pdf: WP4/D4.7/*.png WP4/D4.7/*.jpg


.SECONDARY:

clean:
	-rm $(DELIVERABLES:%=%/report.pdf)

real-clean: clean
	-rm $(GITHUBISSUEDESCRIPTIONS)
	-rm $(DELIVERABLES:%=%/github-issue-description.tex)

update-github-issue-description: $(DELIVERABLES:%=%/github-issue-description.md)

