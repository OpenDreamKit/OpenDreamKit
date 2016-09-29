\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{deliverablereport}[2016/09/29 v1.0 ODK Deliverable Report]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{eudelivreport}}
\ProcessOptions
\LoadClass{eudelivreport}

% Specific to ODK
\newcommand{\prop@gen@proposalnumber}{676541}
\newcommand{\prop@gen@acronym}{\href{http://opendreamkit.org}{OpenDreamKit}}
\renewcommand{\prop@gen@instrument}{H2020-EINFRA-2015-1} % euproposal.cls defines it
\newcommand{\prop@gen@logo}{ODK_elected_logo}
\newcommand{\prop@gen@image}{Flag_of_Europe}

\input{../../Proposal/final.pdata}
\input{../../Proposal/WApersons}
