%%
%% This is file `dfgreporting.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% dfgproposal.dtx  (with options: `reporting')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{dfgreporting}[2016/12/15 v1.4 DFG Project Reporting]
\DeclareOption{german}{\PassOptionsToPackage{\CurrentOption}{dfgpdata}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{reporting}}
\ProcessOptions
\LoadClass{reporting}
\RequirePackage{eurosym}
\RequirePackage{dfgpdata}
\ifdeutsch\RequirePackage[ngerman]{babel}
\else\RequirePackage[ngerman,USenglish]{babel}\fi
\define@key{prop@gen}{reportperiod}{\def\prop@gen@reportperiod{#1}}
\define@key{prop@gen}{applareas}{\def\prop@gen@applareas{#1}}
\define@key{prop@gen}{key}{\@dmp{key=#1}%
\@ifundefined{prop@gen@keys}{\xdef\prop@gen@keys{#1}}{\xdef\prop@gen@keys{\prop@gen@keys,#1}}}
\define@key{prop@gen}{coop}{\@dmp{coop=#1}%
\@ifundefined{prop@gen@coops}{\xdef\prop@gen@coops{{#1}}}{\xdef\prop@gen@coops{\prop@gen@coops,{#1}}}}
\define@key{prop@gen}{projpapers}{\def\prop@gen@projpapers{#1}}
\newcommand\dfg@applicants@table%
{\begin{tabular}{|l|*{\the@PIs}{l|}}\hline
\dfg@applicants@lines\hline
&\multicolumn{\the@PIs}{|l|}{\textbf{Private Address\deu{ (Privatanschrift)}:}}\\\hline
\dfg@applicants@private@lines\hline
\end{tabular}}
\newcommand\dfg@institute@table%
{\begin{tabular}{|l|*{\the@PIs}{l|}}\hline
\dfg@applicants@institute@lines\hline
\end{tabular}}
\newcommand\prop@assoc[2]{\let\@tmpop=\relax\@for\@I:=#2\do{\@tmpop\@I\let\@tmpop=#1}}
\newcommand\show@prop@gen@keys{\def\@cb{, }\@ifundefined{prop@gen@keys}{??:???? ?/?}{\prop@assoc\@cb\prop@gen@keys}}
\renewenvironment{prop@report}
{\selectlanguage{USenglish}
\thispagestyle{empty}%
\begin{center}
  {\LARGE Final Project Report}\\[.2cm]
  {\LARGE\textbf{\prop@gen@title}}\\[.3cm]
  {\LARGE Acronym: {\prop@gen@acronym}}\\[.2cm]
  {\large Reference number(s): \show@prop@gen@keys}\\[.2cm]
  {\large\today}\\[1em]
 \begin{tabular}{c*{\the@PIs}{c}}
   \prop@tl\prop@gen@PIs{\wa@ref3{person}\tl@ext{name}}\\
   \prop@tl\prop@gen@PIs{\wa@ref3{institution}{\wa@ref3{person}\tl@ext{affiliation}}{name}}
 \end{tabular}\\[2cm]
\end{center}
\setcounter{tocdepth}{1}\tableofcontents\newpage\setcounter{page}{1}
\section{General Information \deu{(Allgemeine Angaben)}}
\subsection{Reference Numbers \deu{(DFG Gesch\"aftszeichen)}}
\show@prop@gen@keys
\dfg@applicants
\subsection{Institute/Chair \deu{(Institut/Lehrstuhl)}}\dfg@institute@table
\dfg@topic
\subsection{Report and Funding Period \deu{(Berichts- und F\"orderzeitraum)}}
\prop@gen@reportperiod
\dfg@area@field
\subsection{Application Areas \deu{(Verwertungsfelder)}}\prop@gen@applareas
\dfgprojpapers\prop@gen@projpapers}
{\signatures{Signatures \deu{(Unterschriften)}}}
\endinput
%%
%% End of file `dfgreporting.cls'.
