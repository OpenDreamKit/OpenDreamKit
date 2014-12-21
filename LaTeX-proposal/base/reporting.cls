%%
%% This is file `reporting.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% proposal.dtx  (with options: `reporting')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{reporting}[2013/02/19 v1.4 Project Reporting]
\newif\if@wpsubsection\@wpsubsectionfalse
\newif\ifsubmit\submitfalse
\newif\ifpublic\publicfalse
\newif\ifkeys\keysfalse
\newif\ifdelivs\delivsfalse
\newif\ifwork@areas\work@areastrue
\newif\if@RAM\@RAMfalse
\newif\if@svninfo\@svninfofalse
\newif\if@gitinfo\@gitinfofalse
\def\proposal@class{article}
\DeclareOption{wpsubsection}{\@wpsubsectiontrue}
\DeclareOption{submit}{\submittrue}
\DeclareOption{gitinfo}{\@gitinfotrue}
\DeclareOption{svninfo}{\@svninfotrue}
\DeclareOption{public}{\publictrue}
\DeclareOption{noworkareas}{\work@areasfalse\PassOptionsToClass{\CurrentOption}{pdata}}
\DeclareOption{RAM}{\@RAMtrue}
\DeclareOption{report}{\def\proposal@class{report}}
\DeclareOption{keys}{\keystrue}
\DeclareOption{deliverables}{\delivstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[a4paper,twoside]{\proposal@class}
\RequirePackage{amssymb}
\RequirePackage{url}
\RequirePackage{graphicx}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{rotating}
\RequirePackage{fancyhdr}
\RequirePackage{array}
\RequirePackage{xspace}
\RequirePackage{comment}
\AtBeginDocument{\ifpublic\excludecomment{private}\fi}
\RequirePackage{tikz}
\RequirePackage{paralist}
\RequirePackage{a4wide}
\RequirePackage{boxedminipage}
\renewcommand{\thempfootnote}{\roman{mpfootnote}}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[scaled=.90]{helvet}
\RequirePackage{textcomp}
\RequirePackage[hyperref=auto,style=numeric,defernumbers=true,backend=bibtex,backref=true,firstinits=true,maxbibnames=6]{biblatex}[2010/11-19]
\RequirePackage{csquotes}
\RequirePackage{mdframed}
\RequirePackage{pdata}
\definecolor{darkblue}{rgb}{0,0,.7}
\ifsubmit\def\prop@link@color{darkblue}\else\def\prop@link@color{blue}\fi
\RequirePackage[bookmarks=true,linkcolor=\prop@link@color,
 citecolor=\prop@link@color,urlcolor=\prop@link@color,colorlinks=true,
 breaklinks=true, bookmarksopen=true]{hyperref}
\ifsubmit
\RequirePackage[hide]{ed}
\if@svninfo\RequirePackage[final,today]{svninfo}\fi
\else
\RequirePackage[show]{ed}
\if@svninfo\RequirePackage[eso-foot,today]{svninfo}\fi
\if@gitinfo\RequirePackage[mark]{gitinfo2}\fi
\fi
\renewcommand\ednoteshape{\sl\footnotesize}
\ifpublic\excludecomment{private}\else\includecomment{private}\fi
\setcounter{secnumdepth}{3}
\newif\ifofpage\ofpagefalse
\fancyhead[RE,LO]{\prop@gen@acronym}
\fancyhfoffset{0pt}
\fancyfoot[C]{}
\newcommand\prop@of@pages[2]{page~#1\ifofpage~of~#2\fi}
\fancyhead[LE,RO]{\prop@of@pages\thepage{\pdataref@num{prop}{page}{last}}}
\pagestyle{fancyplain}
\newif\if@report\@reportfalse
\newenvironment{report}[1][]%
{\@reporttrue\readpdata\jobname%
\ofpagetrue\setkeys{prop@gen}{#1}%
\pdata@open\jobname%
\@ifundefined{prop@gen@PIs}{}{\newcounter{@PIs}\@for\@I:=\prop@gen@PIs\do{\stepcounter{@PIs}}}%
\@ifundefined{prop@gen@sites}{}{\newcounter{@sites}\@for\@I:=\prop@gen@sites\do{\stepcounter{@sites}}}%
\setcounter{page}{0}%
\begin{prop@report}}
{\end{prop@report}%
\pdata@def{prop}{page}{last}{\thepage}\ofpagefalse\newpage
\printbibliography[heading=warnpubs]
\pdata@close}
\newenvironment{prop@report}
{\begin{center}
  {\LARGE Final Project Report}\\[.2cm]
  {\LARGE\textbf{\prop@gen@title}}\\[.3cm]
  {\LARGE Acronym: {\prop@gen@acronym}}\\[.2cm]
  {\large\today}\\[1em]
  \begin{tabular}{c*{\the@PIs}{c}}
    \prop@tl\prop@gen@PIs{\wa@ref{person}\tl@ext{name}}\\
    \prop@tl\prop@gen@PIs{\wa@ref{institution}{\wa@ref{person}\tl@ext{affiliation}}{name}}
 \end{tabular}\\[2cm]
\end{center}
\setcounter{tocdepth}{2}\tableofcontents\newpage\setcounter{page}{1}}
{}
\defbibheading{empty}{}
\newif\if@allpapers\@allpaperstrue
\newcommand\prop@ppl[3][]{\@allpapersfalse\message{ppl processing: #2}%
\printbibliography[heading=subbibliography,type=#2,title=#3#1]%
\@ifundefined{prop@rl}{\xdef\prop@rl{#2}}{\xdef\prop@rl{\prop@rl, #2}}}
\newcommand\prop@prl[1]{\message{unclassified: #1}%
\printbibliography[heading=subbibliography,title=Unclassified,#1]}%
\define@key{paperlist}{unclassified}[true]{\message{unclass: \prop@rl}\prop@prl\prop@rl}
\define@key{paperlist}{articles}[true]{\prop@ppl{article}{Articles}}
\define@key{paperlist}{chapters}[true]{\prop@ppl{inbook}{Book Chapters}}
\define@key{paperlist}{confpapers}[true]{\prop@ppl[,keyword=conference]{inproceedings}{Conference Papers}}
\define@key{paperlist}{wspapers}[true]{\prop@ppl[,notkeyword=conference]{inproceedings}{Workshop Papers}}
\define@key{paperlist}{theses}[true]{\prop@ppl{thesis}{Theses}}
\define@key{paperlist}{submitted}[true]{\prop@ppl[,keyword=submitted]{unpublished}{Submitted}}
\define@key{paperlist}{books}[true]{\prop@ppl{book}{Monographs}}
\define@key{paperlist}{techreports}[true]{\prop@ppl{techreport}{Technical Reports}}
\DeclareBibliographyCategory{featured}
\newcommand\prop@paperlist[2][]{%
\begin{refsection}%
\nocite{#2}\addtocategory{featured}{#2}%
\let\biboldfont\bibfont%
\renewcommand{\bibfont}{\footnotesize}%
\renewcommand{\baselinestretch}{.9}
\setkeys{paperlist}{#1}
\@ifundefined{prop@rl}{}{\@latex@warning{some papers are not classified!}}
\if@allpapers\printbibliography[heading=empty]\fi%
\let\bibfont\biboldfont%
\end{refsection}}
\def\prop@warnpubs@message{Many of the proposers' publications are online at one of the following URIs:}
\def\prop@warnpubs@title{References}
\defbibheading{warnpubs}{\section*{\prop@warnpubs@title}%
  \@ifundefined{prop@gen@pubspages}
 {\@latex@warning{No publication pages specified;
                   use the pubspage key in the proposal environment!}}
  {\prop@warnpubs@message%
 \@for\@I:=\prop@gen@pubspages\do{\par\noindent\csname\@I\endcsname}}}
\defbibheading{empty}{}
\endinput
%%
%% End of file `reporting.cls'.
