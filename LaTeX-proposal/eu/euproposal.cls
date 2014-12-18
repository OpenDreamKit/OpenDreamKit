%%
%% This is file `euproposal.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% euproposal.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{euproposal}[2013/01/13 v1.4 EU Proposal]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{proposal}}
\ProcessOptions
\LoadClass[report,noRAM]{proposal}
\RequirePackage{longtable}
\RequirePackage{eurosym}
\RequirePackage{wrapfig}
\RequirePackage{eupdata}
\def\thepart{\Alph{part}}
\setcounter{part}{2}
\def\thechapter{\thepart.\arabic{chapter}}
\def\numberline#1{\hb@xt@\@tempdima{#1\hfil} }
\newcommand\prop@sites@table{\def\@@table{}
{\let\tabularnewline\relax\let\hline\relax
\@for\@I:=\prop@gen@sites\do{\xdef\@@table{\@@table\pdataref{site}\@I{number}}
\xdef\@@table{\@@table&\@nameuse{wa@institution@\@I @name}}
\xdef\@@table{\@@table&\@nameuse{wa@institution@\@I @acronym}}
\xdef\@@table{\@@table&\@nameuse{wa@institution@\@I @countryshort}\tabularnewline\hline}}}
\begin{tabular}{|l|p{8cm}|l|l|}\hline%|
\# & Participant organisation name & Short name &  Country\\\hline\hline
\@@table
\end{tabular}}
\renewenvironment{prop@proposal}
{\thispagestyle{empty}\begin{center}
  {\Large \prop@gen@instrument}\\[.2cm]
  {\LARGE\textbf\prop@gen@callname}\\[.4cm]
  {\Large \prop@gen@callid}\\[.4cm]
  {\LARGE\textbf\prop@gen@title}\\[.3cm]
  {\LARGE Acronym: {\prop@gen@acronym}}\\[.2cm]
\end{center}
{\large\prop@gen@instrument}\\
{\large\textbf{Date of Preparation: \today}}
\ifsubmit\else\\
{\large\textbf{Revision}:
\if@svninfo\svnInfoRevision\fi\if@gitinfo\gitAbbrevHash\fi
 of
\if@svninfo\svnInfoDate\fi\if@gitinfo\gitAuthorDate\fi}
\fi\\[1em]
{\large}
\begin{large}
 \begin{description}
  \item[Work program topics addressed by \pn:]
    \@ifundefined{prop@gen@topicsaddressed}
    {\textbf{Challenge \prop@gen@challengeid}: \prop@gen@challenge,
    \textbf{Objective \prop@gen@objectiveid}: \prop@gen@objective,
    \textbf{target outcome \prop@gen@outcomeid}) \prop@gen@outcome.}
    {\prop@gen@topicsaddressed}\\[1em]
  \item[Coordinator:] \wa@ref{person}\prop@gen@coordinator{name}
  \item[e-mail:] \wa@ref{person}\prop@gen@coordinator{email}
  \item[tel/fax:] \wa@ref{person}\prop@gen@coordinator{worktelfax}
  \end{description}
\end{large}
\vspace*{1em}
\begin{center}
\prop@sites@table\vfill
\@ifundefined{prop@gen@iconrowheight}{}
{\@for\@site:=\prop@gen@sites\do{\wa@institution@logo[height=\prop@gen@iconrowheight]\@site\qquad}}
\end{center}
\newpage
\setcounter{tocdepth}{2}\setcounter{part}{2}}
{\newpage\printbibliography[heading=warnpubs,maxnames=999]}
\def\prop@gen@instrument{Proposal Instrument (e.g. IP)}
\newenvironment{sitedescription}[2][]{\def\@test{#1}%
\begin{wrapfigure}{r}{5.4cm}\vspace{-2.5ex}%
\begin{tabular}{|p{5cm}|}\hline\vspace{1mm}%
\ifx\@test\@empty%
\wa@institution@logo[height=1.3cm]{#2}\else%
\wa@institution@logo[#1]{#2}\fi\\[1ex]%
\textbf{\wa@ref{institution}{#2}{type}.\hfill \wa@ref{institution}{#2}{country}}\\%
\small\wa@ref{institution}{#2}{streetaddress}, \wa@ref{institution}{#2}{townzip}\\\hline%
\end{tabular}\vspace{-2.5ex}%
\end{wrapfigure}%
\pdata@target{site}{#2}%
{\subsection{\wa@ref{institution}{#2}{acronym}:%
{\textsc{\wa@ref{institution}{#2}{name}}  (\wa@ref{institution}{#2}{countryshort})}}}%
\small%
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {0.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}}
{}
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
\setcounter{@sitespt}{\thewp@sites@num}\addtocounter{@sitespt}{2}%
\par\noindent\begin{tabular}{|l|*{\thewp@sites@num}{c|}c|}\hline%
\multicolumn{\the@sitespt}{|l|}{\textbf{\wp@mk@title{\wp@num}: }%
\textsf{\pdata@target{wp}{\wp@id}{\pdataref{wp}\wp@id{title}}}}\\\hline%
\textbf{Start: }\pdataref{wp}\wp@id{start}&%
\multicolumn{\the@sitespo}{l|}{\textbf{Activity Type: }\pdataref{wp}\wp@id{type}}\\\hline%
\wp@sites@line\\\hline%
\wp@efforts@line\\\hline%
\end{tabular}\smallskip\par\noindent\ignorespaces}
\surroundwithmdframed{wpdelivs}
\newenvironment{risk}[3]
{\paragraph{Risk: #1}\hfill\emph{probability}: #2, \emph{gravity}: #3\par\noindent\ignorespaces}
{}
\newenvironment{riskcont}[3]
{\begin{risk}{#1}{#2}{#3}\textbf{Contingency:} }
{\end{risk}}
\newcommand\keypubs[1]{%
\paragraph{Key publications relevant to the project}%
{\renewcommand{\baselinestretch}{.9}\prop@paperlist{#1}}}
\endinput
%%
%% End of file `euproposal.cls'.
