%%
%% This is file `reporting.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% proposal.dtx  (with options: `reporting')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{reporting}[2016/12/15 v1.6 Project Reporting]
\newif\if@wpsubsection\@wpsubsectionfalse
\newif\ifsubmit\submitfalse
\newif\ifgrantagreement\grantagreementfalse
\newif\ifpublic\publicfalse
\newif\ifkeys\keysfalse
\newif\ifdelivs\delivsfalse
\newif\ifwork@areas\work@areastrue
\newif\if@RAM\@RAMfalse
\newif\if@svninfo\@svninfofalse
\newif\if@gitinfo\@gitinfofalse
\newif\if@numericcites\@numericcitesfalse
\newif\if@longtasklabels\@longtasklabelsfalse
\def\proposal@class{article}
\DeclareOption{wpsubsection}{\@wpsubsectiontrue}
\DeclareOption{submit}{\submittrue}
\DeclareOption{grantagreement}{\grantagreementtrue}
\DeclareOption{gitinfo}{\@gitinfotrue}
\DeclareOption{numericcites}{\@numericcitestrue}
\DeclareOption{svninfo}{\@svninfotrue}
\DeclareOption{public}{\publictrue}
\DeclareOption{noworkareas}{\work@areasfalse\PassOptionsToClass{\CurrentOption}{pdata}}
\DeclareOption{RAM}{\@RAMtrue}
\DeclareOption{report}{\def\proposal@class{report}}
\DeclareOption{keys}{\keystrue}
\DeclareOption{deliverables}{\delivstrue}
\DeclareOption{longtasklabels}{\@longtasklabelstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[a4paper,twoside]{\proposal@class}
\RequirePackage{proposal}
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
  \ifx\prop@gen@acronym\@empty\else{\LARGE Acronym: {\prop@gen@acronym}}\\[.2cm]\fi
  {\large\today}\\[1em]
  \begin{tabular}{c*{\the@PIs}{c}}
    \prop@tl\prop@gen@PIs{\wa@ref3{person}\tl@ext{name}}\\
    \prop@tl\prop@gen@PIs{\wa@ref3{institution}{\wa@ref3{person}\tl@ext{affiliation}}{name}}
 \end{tabular}\\[2cm]
\end{center}
\setcounter{tocdepth}{2}\tableofcontents\newpage\setcounter{page}{1}}
{}

\endinput
%%
%% End of file `reporting.cls'.
