%%
%% This is file `euproposal.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% euproposal.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{euproposal}[2016/12/15 v1.5 EU Proposal]
\newif\ifpartB\partBfalse
\DeclareOption{partB}{\partBtrue}
\newif\if@split\@splitfalse
\DeclareOption{split}{\@splittrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{proposal}}
\ProcessOptions
\ifpartB\LoadClass[report]{proposal}\else\LoadClass{proposal}\fi
\RequirePackage{longtable}
\RequirePackage{eurosym}
\RequirePackage{wrapfig}
\RequirePackage{eupdata}
\RequirePackage{datetime}
\RequirePackage{chngcntr}
\counterwithin{figure}{subsection}
\counterwithin{table}{subsection}
\setcounter{secnumdepth}{4}
\ifpartB
\def\thepart{\Alph{part}}
\setcounter{part}{2}
\def\thechapter{\thepart.\arabic{chapter}}
\def\numberline#1{\hb@xt@\@tempdima{#1\hfil} }
\fi
\newcommand\prop@sites@table{\def\@@table{}
{\let\tabularnewline\relax\let\hline\relax
\@for\@I:=\prop@gen@sites\do{\xdef\@@table{\@@table\pdataref{site}\@I{number}}
\xdef\@@table{\@@table&\@nameuse{wa@institution@\@I @name}
\ifx\@I\prop@gen@coordinatorsite (coordinator)\fi}
\xdef\@@table{\@@table&\@nameuse{wa@institution@\@I @acronym}}
\xdef\@@table{\@@table&\@nameuse{wa@institution@\@I @countryshort}\tabularnewline\hline}}}
\begin{tabular}{|l|p{8cm}|l|l|}\hline%|
\# & Participant organisation name & Short name &  Country\\\hline\hline
\@@table
\end{tabular}}
\renewenvironment{prop@proposal}
{\ifgrantagreement\else
  \thispagestyle{empty}\begin{center}
  {\Large \prop@gen@instrument}\\[.2cm]
  {\Large\textbf\prop@gen@callname}\\[.4cm]
  {\LARGE \prop@gen@callid}\\[.8cm]
  {\huge\textbf\prop@gen@title}\\[.4cm]
  \ifx\prop@gen@acronym\@empty\else{\LARGE Acronym: {\prop@gen@acronym}}\\[2cm]\fi
\end{center}
{\large\textbf{Date of Preparation: \today: \currenttime}}
\\[1em]
\begin{large}
 \begin{description}
  % \item[Work program topics addressed by \pn:]
  %   \@ifundefined{prop@gen@topicsaddressed}
  %   {\textbf{Challenge \prop@gen@challengeid}: \prop@gen@challenge,
  %   \textbf{Objective \prop@gen@objectiveid}: \prop@gen@objective,
  %   \textbf{target outcome \prop@gen@outcomeid}) \prop@gen@outcome.
  %   {\prop@gen@topicsaddressed}\\[1em]
  \item[Coordinator:] \wa@ref3{person}\prop@gen@coordinator{name}
  \item[e-mail:] \wa@ref3{person}\prop@gen@coordinator{email}
  \item[tel/fax:] \wa@ref3{person}\prop@gen@coordinator{worktelfax}
    \@ifundefined{prop@gen@keywords}{}{\item[Keywords:]  \prop@gen@keywords}
  \end{description}
\end{large}
\vspace*{1em}
\begin{center}
\prop@sites@table\vfill
\@ifundefined{prop@gen@iconrowheight}{}
{\@for\@site:=\prop@gen@sites\do{\wa@institution@logo[height=\prop@gen@iconrowheight]\@site\qquad}}
\end{center}
\newpage
\fi% ifgrantagreement
\setcounter{tocdepth}{2}\setcounter{part}{2}}
{\newpage\printbibliography[heading=warnpubs]%
\if@split
\newwrite\@@SPLIT%
\immediate\openout\@@SPLIT=SPLIT.at%
\protected@write\@@SPLIT{}{\thepage}%
\closeout\@@SPLIT%
\fi}% if@split
\def\prop@gen@instrument{Proposal Instrument (e.g. IP)}
\define@key{site@desc}{box}[true]{\def\site@desc@box{#1}%
\pdata@def{sitedesc}{\@site}{box}{#1}}
\define@key{site@desc}{logo}[true]{\def\site@desc@logo{#1}%
\pdata@def{sitedesc}{\@site}{logo}{#1}}
\define@key{site@desc}{width}{\def\site@desc@width{#1}%
\pdata@def{sitedesc}{\@site}{width}{#1}\@dmp{wd=#1}}
\define@key{site@desc}{height}{\def\site@desc@height{#1}%
\pdata@def{sitedesc}{\@site}{height}{#1}\@dmp{ht=#1}}
\newenvironment{sitedescription}[2][]%
{\def\c@site{#2}% remember the site ID
\newcounter{site@#2@PM} % for the site PM
\def\site@desc@box{false}% not box unless requested
\def\site@desc@logo{false}% not logo unless requested
\def\site@desc@height{1.3cm}% default height
\def\site@desc@width{5cm}% default width
\setkeys{site@desc}{#1}% read the keys to overwrite the defaults
\ifx\@site@desc@box\@true% if we want a logo
\begin{wrapfigure}{r}{\site@desc@width}\vspace{-2.5ex}%
\begin{tabular}{|p{\site@desc@width}|}\hline\vspace{1mm}%
\ifx\@site@desc@logo\@true% if we want a logo
\wa@institution@logo[height=\site@desc@width]{#2}\\[1ex]%
\fi% end logo
\textbf{\wa@ref3{institution}{#2}{type}.\hfill \wa@ref3{institution}{#2}{country}}\\%
\small\wa@ref3{institution}{#2}{streetaddress}, \wa@ref3{institution}{#2}{townzip}\\\hline%
\end{tabular}\vspace{-2.5ex}%
\end{wrapfigure}%
\fi% end box
\pdata@target{site}{#2}%
{\subsubsection{\wa@ref3{institution}{#2}{acronym}: % space here
{\textsc{\wa@ref3{institution}{#2}{name}}  (\wa@ref3{institution}{#2}{countryshort})}}}%
\small%
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {0.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}}
{\pdata@def{site}{\c@site}{reqPM}{\csname thesite@\c@site @PM\endcsname}}
\define@key{site@part}{type}{\def\site@part@type{#1}\@dmp{type=#1}}
\define@key{site@part}{PM}{\def\site@part@PM{#1}\@dmp{PM=#1}}
\define@key{site@part}{salary}{\def\site@part@salary{#1}}%\@dmp{\euro=#1}}
\define@key{site@part}{gender}{\def\site@part@gender{#1}}%\@dmp{\euro=#1}}
\newenvironment{participant}[2][]%
{\def\site@part@type{}\def\site@part@PM{}\def\site@part@salary{}\def\site@part@gender{}%
\setkeys{site@part}{#1}%
\ifx\site@part@PM\@empty\else\addtocounter{site@\c@site @PM}{\site@part@PM}\fi%
\paragraph*{#2\ %
(\ifx\site@part@type\@empty\else\site@part@type\fi%
\ifx\site@part@gender\@empty\else, \site@part@gender\fi%
\ifx\site@part@PM\@empty\else, \site@part@PM~PM\fi%
)}%
\ignorespaces}
{\par\medskip}
\newmdenv[frametitle=Objectives]{wpobjectives}
\newmdenv[frametitle=Description]{wpdescription}
\renewenvironment{workpackage}[1][]
{\begin{work@package}[#1]\medskip\wpheadertable%
\addcontentsline{toc}{subsubsection}{\wp@label\wp@num: \pdataref{wp}\wp@id{title}}}
{\end{work@package}}
\newcounter{@sitespo}\newcounter{@sitespt}
\renewcommand\wpheadertable{%
\wp@sites@efforts@lines%
\setcounter{@sitespo}{\thewp@sites@num}\addtocounter{@sitespo}{1}%
\par\noindent\begin{tabular}{|l|*{\thewp@sites@num}{c|}c|}\hline%
\multicolumn{\the@sitespo}{|l|}{\textbf{\wp@mk@title{\wp@num}: }%
\textsf{\pdata@target{wp}{\wp@id}{\pdataref{wp}\wp@id{title}}}}
&\textbf{Start: }\pdataref{wp}\wp@id{start}\\\hline%
\wp@sites@line\\\hline%
\wp@efforts@line\\\hline%
\end{tabular}\smallskip\par\noindent\ignorespaces}
\surroundwithmdframed{wpdelivs}
\define@key{milestone}{verif}{\gdef\mile@verif{#1}\pdata@def{mile}\mile@id{verif}{#1}}
\define@key{mst}{caption}{\gdef\mst@caption{#1}}
\define@key{mst}{wname}{\gdef\mst@wname{#1}}
\define@key{mst}{wdeliv}{\gdef\mst@wdeliv{#1}}
\define@key{mst}{wverif}{\gdef\mst@wverif{#1}}
\newcommand\milestonetable[1][]{%
\IfFileExists{./\jobname.deliverables}{% to avoid errros
\message{euproposal.cls: Generating Milestones Table}%
\def\mst@caption{Milestones, Deliverables, and Verification}%
\def\mst@wname{2.5cm}\def\mst@wdeliv{7cm}\def\mst@wverif{4cm}
\setkeys{mst}{#1}%
{\gdef\mst@lines{}%initialize
\let\tabularnewline\relax\let\hline\relax% so they
\let\textbf\relax\let\emph\relax% do not bother us
\edef\@@miles{\pdataref{all}{mile}{ids}}
\@for\@I:=\@@miles\do{
\edef\@delivs{\pdataref@safe{mile}{\@I}{delivs}}%
\def\@@delivs{}
\@for\@J:=\@delivs\do{\xdef\@@delivs{\@@delivs\ \pdataref{deliv}\@J{label}}}
\def\@@line{
\textbf{\pdataref{mile}\@I{label}}&
\emph{\pdataref{mile}{\@I}{title}} &
\@@delivs&
\pdataref{mile}\@I{month} &
\pdataref{mile}\@I{verif}}
\xdef\mst@lines{\mst@lines\@@line\tabularnewline\hline}}}
\begin{table}[ht]
\begin{tabular}{|l|p{\mst@wname}|p{\mst@wdeliv}|l|p{\mst@wverif}|}\hline
\#&\textbf{\miles@legend@name}
&\textbf{\miles@legend@involved}
&\textbf{\miles@legend@mo}
&\textbf{\miles@legend@verif}\\\hline\hline
\mst@lines
\end{tabular}
\caption{\mst@caption\ ($^\ast$\miles@legend)}\label{tab:milestonetable}
\end{table}}
{\ClassWarning{not formatting mile stones table yet, deliverables are
  still missing; generate\jobname.deliverables\ to get it!}}}
\newcommand\miles@legend@name{Name}
\newcommand\miles@legend@mo{Mo}
\newcommand\miles@legend@verif{Means of Verif.}
\newcommand\miles@legend@involved{WPs$^\ast$/Deliverables involved}
\newcommand\miles@legend{WP is first number in deliverable label}
\newcommand\prop@milesfor[1]{\edef\@delivs{\pdataref@safe{mile}{#1}{delivs}}%
\let\m@sep=\relax\def\new@sep{,\ }%
\@for\@I:=\@delivs\do{\m@sep\pdataRef{deliv}\@I{label}\let\m@sep=\new@sep}}
\newenvironment{risk}[3]
{\paragraph{Risk: #1}\hfill\emph{probability}: #2, \emph{gravity}: #3\par\noindent\ignorespaces}
{}
\newenvironment{riskcont}[3]
{\begin{risk}{#1}{#2}{#3}\textbf{Contingency:} }
{\end{risk}}
\newcommand\keypubs[1]{%
\begin{refsection}\nocite{#1}\printbibliography[heading=empty]\end{refsection}}
\endinput
%%
%% End of file `euproposal.cls'.
