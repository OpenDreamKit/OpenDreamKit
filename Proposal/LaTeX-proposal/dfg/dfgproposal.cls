%%
%% This is file `dfgproposal.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% dfgproposal.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{dfgproposal}[2016/12/15 v1.4 DFG Proposal]
\newif\ifgeneral\generalfalse
\DeclareOption{general}{\generaltrue}
\DeclareOption{german}{\PassOptionsToPackage{\CurrentOption}{dfgpdata}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{proposal}}
\ProcessOptions
\LoadClass{proposal}
\RequirePackage{eurosym}
\RequirePackage{dfgpdata}
\ifdeutsch\RequirePackage[ngerman]{babel}
\else\RequirePackage[ngerman,USenglish]{babel}\fi
\newenvironment{sitedescription}[2][]%
{\def\@test{#1}\def\@@title{\ifx\@test\@empty\wa@ref3{institution}{#2}{acronym}\else #1\fi:
\textsc{\wa@ref3{institution}{#2}{name}}}
\@for\@I:=#2\do{\pdata@target{site}\@I{}}\subsubsection\@@title}
{}
\newlength\applicants@table@columnwidth
\newcommand\dfg@applicants@table%
{\setlength\applicants@table@columnwidth\textwidth
\advance\applicants@table@columnwidth by -6em
\divide\applicants@table@columnwidth by \the@PIs
\ifnum\the@PIs>2\begin{tabular}{|l|*{\the@PIs}{p{\applicants@table@columnwidth}|}}
\else\begin{tabular}{|l|*{\the@PIs}{l|}}\fi
\hline
\dfg@applicants@lines\hline
&\multicolumn{\the@PIs}{|l|}{\textbf{Work Address\deu{ (Dienstanschrift)}:}}\\\hline
\dfg@applicants@institute@lines\hline
&\multicolumn{\the@PIs}{|l|}{\textbf{Private Address\deu{ (Privatanschrift)}:}}\\\hline
\dfg@applicants@private@lines\hline
\end{tabular}}
\renewenvironment{prop@proposal}
{\ifgeneral
\ifsubmit\setcounter{page}{1}\else
\thispagestyle{empty}%
\begin{center}
{\LARGE \prop@gen@instrument}\\[.2cm]
{\LARGE\textbf{\prop@gen@title}}\\[.3cm]
\ifx\prop@gen@acronym\@empty\else{\LARGE Acronym: {\prop@gen@acronym}}\\[.2cm]\fi
{\large\today}\\[1em]
\WAauthorblock[aff]\prop@gen@PIs\\[2cm]
\end{center}
\setcounter{section}{-1}
\edef\keep@tocdepth{\value{tocdepth}}
\setcounter{tocdepth}{2}\tableofcontents
\setcounter{tocdepth}{\keep@tocdepth}
\newpage\thispagestyle{empty}
\ifdeutsch\section{Allgemeine Angaben (nur f\"ur ELAN)}\else
\section{General Information (for the ELAN system only)}\fi
\dfg@applicants
\dfg@topic
\dfg@area@field
\ifdeutsch\subsection{Voraussichtliche Gesamtdauer}\else
\subsection{Anticipated total duration \deu{(Voraussichtliche Gesamtdauer)}}
\fi% ifdeutsch
\@ifundefined{prop@gen@totalduration}{????}{\prop@gen@totalduration};
\ifdeutsch
\@ifundefined{prop@gen@since}{Erstantrag}{Fortsetungsantrag, das Project l\"auft seit
  \prop@gen@since.}
\else
\@ifundefined{prop@gen@since}{initial proposal}{continuation proposal, the project started
  \prop@gen@since.}
\fi%ifdeutsch
\ifdeutsch\subsection{Antragszeitraum}\else
\subsection{Application period \deu{(Antragszeitraum)}}\fi
\prop@gen@months\quad Months starting \prop@gen@start
\@ifundefined{prop@gen@fundsuntil}{}
{ (\ifdeutsch Mittel reichen bis\else funds last until\fi\ \prop@gen@fundsuntil)}
\ifdeutsch\else\selectlanguage{USenglish}\fi
\newpage
\setcounter{page}{0}%
\fi\fi}% ifsubmit ifgeneral
{}
\ifdeutsch
\def\prop@warnpubs@message{Viele der Publikationen der Antragsteller sind verf\"ugbar unter folgenden URLs:}
\def\prop@warnpubs@title{Literatur}
\fi
\newcommand\attachments{\ifdeutsch\section{Verzeichnis der Anlagen}\else
\section{List of Attachments \deu{(Verzeichnis der Anlagen)}}\fi
\begin{itemize}
\@for\@I:=\prop@gen@PIs\do{%
 \item\ifdeutsch Lebenslauf und Publikatinsverzeichnis\else
 Curriculum Vitae and list of publications for \fi
   \@nameuse{wa@person@\@I @personaltitle}
   \@nameuse{wa@person@\@I @name}
  (CD + \ifdeutsch Ausdruck\else printed version\fi)}
\ifdeutsch
\item Publications either cited in section~\ref{sec:ourpubs} or occurring in one of the
  curricula vitae (CD only)\else
\item Zitierte Publikationen aus Abschnitt~\ref{sec:ourpubs} oder einem der Lebensl\"aufe
  (nur CD)\fi
\end{itemize}}
\ifgeneral
\newenvironment{Zusammenfassung}{\thispagestyle{empty}\subsection{Zusammenfassung}\begin{otherlanguage}{ngerman}}
{\end{otherlanguage}\newpage\setcounter{page}1}
\newenvironment{Summary}{\thispagestyle{empty}\subsection{Summary}}
{\newpage\setcounter{page}1}
\else
\excludecomment{Summary}
\excludecomment{Zusammenfassung}
\fi
\endinput
%%
%% End of file `dfgproposal.cls'.
