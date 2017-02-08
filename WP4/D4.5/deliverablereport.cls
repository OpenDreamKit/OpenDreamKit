\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{deliverablereport}[2016/09/29 v1.0 ODK Deliverable Report]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{eudelivreport}}
\ProcessOptions
\LoadClass{eudelivreport}
\RequirePackage{booktabs}
\RequirePackage{longtable}

% Specific to ODK (this only works for deliverables in the right place)
\newcommand{\prop@gen@proposalnumber}{676541}
\newcommand{\prop@gen@acronym}{\href{http://opendreamkit.org}{OpenDreamKit}}
\renewcommand{\prop@gen@instrument}{H2020-EINFRA-2015-1} % euproposal.cls defines it
\newcommand{\prop@gen@logo}{../../media/ODK_elected_logo}
\newcommand{\prop@gen@image}{../../media/logos/Flag_of_Europe}

\input{../../Proposal/final.pdata}
\input{../../Proposal/WApersons}
