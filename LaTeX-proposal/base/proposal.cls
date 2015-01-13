%%
%% This is file `proposal.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% proposal.dtx  (with options: `cls')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{proposal}[2013/02/19 v1.4 Project Proposal]
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
\RequirePackage[a4paper,margin=20mm]{geometry}
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
\newmdenv[settings=\large]{emphbox}
\newenvironment{prop@proposal}
{\thispagestyle{empty}%
\begin{center}
  {\LARGE \prop@gen@instrument}\\[.2cm]
  {\LARGE\textbf{\prop@gen@title}}\\[.3cm]
  {\LARGE Acronym: {\prop@gen@acronym}}\\[.2cm]
  {\large\today}\\[1em]
  \begin{tabular}{c*{\the@PIs}{c}}
    \prop@tl\prop@gen@PIs{\wa@ref{person}\tl@ext{name}}\\
    \prop@tl\prop@gen@PIs{\wa@ref{institution}{\wa@ref{person}\tl@ext{affiliation}}{name}}
 \end{tabular}\\[2cm]
\end{center}
\setcounter{tocdepth}{2}\tableofcontents\newpage\setcounter{page}{1}}
{\section{List of Attachments}
\begin{itemize}
\@for\@I:=\prop@gen@PIs\do{%
\item Curriculum Vitae and list of publications for
  \wa@ref{person}\@I{personaltitle} \wa@ref{person}\@I{name}
\end{itemize}}\newpage
\printbibliography[heading=warnpubs]}
\newenvironment{proposal}[1][]{\readpdata\jobname
\ofpagetrue\setkeys{prop@gen}{#1}
\pdata@open\jobname
\if@sites\else
\define@key{workpackage}{RM}{\pdata@def{wp}\wp@id{RM}{##1}\@dmp{RM=##1}}
\if@RAM\define@key{workpackage}{RAM}{\pdata@def{wp}\wp@id{RAM}{##1}\@dmp{RAM=##1}}\fi
\fi
\newcounter{@PIs}
\@ifundefined{prop@gen@PIs}{}{\@for\@I:=\prop@gen@PIs\do{\stepcounter{@PIs}}}
\newcounter{@sites}
\@ifundefined{prop@gen@sites}{}{\@for\@I:=\prop@gen@sites\do{\stepcounter{@sites}}}
\setcounter{page}{0}
\begin{prop@proposal}}
{\end{prop@proposal}
\pdata@def{prop}{page}{last}{\thepage}\ofpagefalse
\pdata@close}
\newcommand\site[1]{\hyperlink{site@#1@target}{\wa@ref{institution}{#1}{acronym}}}
\newcommand\sitename[1]{\hyperlink{site@#1@target}{\wa@ref{institution}{#1}{name}}}
\newcommand\objective@label[1]{O#1}
\define@key{obj}{id}{\def\obj@id{#1}\@dmp{id=#1}}
\define@key{obj}{title}{\def\obj@title{#1}\@dmp{title=#1}}
\define@key{obj}{short}{\def\obj@short{#1}\@dmp{short=#1}}
\newcounter{objective}
\newenvironment{objective}[1][]
{\let\obj@id\relax\let\obj@title\relax\let\obj@short\relax%
\setkeys{obj}{#1}\stepcounter{objective}%
\goodbreak\smallskip\par\noindent%
\textbf{\objective@label{\arabic{objective}}:%
~\pdata@target{obj}{\obj@id}{\pdataref{obj}{\obj@id}{title}}\ignorespaces}%
\pdata@def{obj}\obj@id{label}{\objective@label\theobjective}%
\@ifundefined{obj@title}{}{\pdata@def{obj}\obj@id{title}\obj@title}%
\@ifundefined{obj@short}{}{\pdata@def{obj}\obj@id{short}\obj@short}}
{}
\newcommand\OBJref[1]{\pdataRef{obj}{#1}{label}}
\newcommand\OBJtref[1]{\OBJref{#1}: \pdataRefFB{obj}{#1}{short}{title}}
\ifwork@areas
\define@key{workarea}{id}{\def\wa@id{#1}\@dmp{id=#1}}
\define@key{workarea}{title}{\pdata@def{wa}\wa@id{title}{#1}}
\define@key{workarea}{short}{\pdata@def{wa}\wa@id{short}{#1}}
\define@key{workarea}{lead}{\pdata@def{wa}\wa@id{lead}{#1}}
\fi
\define@key{workpackage}{id}{\def\wp@id{#1}\@dmp{id=#1}}
\define@key{workpackage}{title}{\pdata@def{wp}\wp@id{title}{#1}}
\define@key{workpackage}{short}{\pdata@def{wp}\wp@id{short}{#1}}
\define@key{workpackage}{lead}{\pdata@def{wp}\wp@id{lead}{#1}\def\wp@lead{#1}\@dmp{lead=#1}}
\define@key{workpackage}{type}{\def\wp@type{#1}\pdata@def{wp}\wp@id{type}{#1}}
\define@key{workpackage}{wphases}{\def\wp@wphases{#1}\pdata@def{wp}\wp@id{wphases}{#1}}
\define@key{workpackage}{swsites}[true]{\def\wp@swsites{#1}}
\newcommand\wp@mk@title[1]{Work Package {#1}}
\newcommand\wp@label[1]{WP{#1}}
\ifwork@areas
\newcommand\wa@label[1]{WA{#1}}
\newcommand\wa@mk@title[1]{Work Area {#1}}
\fi
\ifwork@areas\newcounter{wa}\newcounter{wp}[wa]\else\newcounter{wp}\fi
\ifdelivs\newcounter{deliv}[wp]\fi
\newcounter{allwp}
\newcommand\update@wps[1]{\@ifundefined{@wps}{\xdef\@wps{#1}}{\xdef\@wps{\@wps,#1}}}
\newcommand\update@tasks[1]{\@ifundefined{@tasks}{\xdef\@tasks{#1}}{\xdef\@tasks{\@tasks,#1}}}
\newcommand\update@deps[1]{\@ifundefined{task@deps}{\xdef\task@deps{#1}}{\xdef\task@deps{\task@deps,#1}}}
\ifwork@areas\def\update@was#1{\@ifundefined{@was}{\xdef\@was{#1}}{\xdef\@was{\@was,#1}}}\fi
\newcommand\decode@wphase[1]{\expandafter\decode@p@start#1@%
\local@count\wphase@end\advance\local@count by -\wphase@start%
\def\wphase@len{\the\local@count}}
\def\decode@p@start#1-#2@{\def\wphase@start{#1}\decode@p@end#2!@}
\def\decode@p@end#1!#2@{\def\wphase@end{#1}\def\@test{#2}%
\ifx\@test\@empty\def\wphase@force{1}\else\decode@p@force#2\fi}
\def\decode@p@force#1!{\def\wphase@force{#1}}
\def\wphases@start#1-#2@{\def\wphase@start{#1}}
\newcommand\startend@wphases[1]{\def\@test{#1}
\ifx\@test\@empty\def\wphase@start{0}\def\wphase@end{0}\else%
\@for\@I:=#1\do{\expandafter\decode@p@start\@I @}
\expandafter\wphases@start#1@\fi}
\newcounter{wp@RM}
\if@RAM\newcounter{wp@RAM}\fi
\newenvironment{work@package}[1][]%
{\def\wp@wphases{0-0}% default values
\def\wp@swsites{false}
\setkeys{workpackage}{#1}\stepcounter{wp}\stepcounter{allwp}%
\startend@wphases\wp@wphases%
\pdata@def{wp}\wp@id{start}\wphase@start\pdata@def{wp}\wp@id{end}\wphase@end%
\@ifundefined{wp@type}{}{\pdata@def{wp}\wp@id{type}\wp@type}%
\let\@tasks=\relax%
\edef\wp@num{\ifwork@areas\thewa.\fi\thewp}%
\pdata@def{wp}\wp@id{label}{\wp@label\wp@num}%
\pdata@def{wp}\wp@id{number}{\thewp}%
\pdata@def{wp}\wp@id{page}{\thepage}%
\update@wps\wp@id%
\edef\wp@num{\ifwork@areas\thewa.\fi\thewp}%
\pdata@def{wp}{\wp@id}{num}{\thewp}%
\if@sites%
\setcounter{wp@RM}{0}\if@RAM\setcounter{wp@RAM}{0}\fi%
\@for\@site:=\prop@gen@sites\do{%
\edef\@RM{\pdataref@num\wp@id\@site{RM}}\addtocounter{wp@RM}{\@RM}%
\if@RAM\edef\@RAM{\pdataref@num\wp@id\@site{RAM}}\addtocounter{wp@RAM}{\@RAM}\fi}
\pdata@def{wp}\wp@id{RM}{\thewp@RM}%
\if@RAM\pdata@def{wp}\wp@id{RAM}{\thewp@RAM}\fi%
\fi}% if@sites
{\@ifundefined{@tasks}{}{\pdata@def{\wp@id}{task}{ids}\@tasks}}
\newenvironment{workpackage}[1][]%
{\begin{work@package}[#1]%
\if@sites\goodbreak\medskip\wpheadertable%
\else\subsubsection*{{\wptitle} (\wprm)}\fi%
\addcontentsline{toc}{paragraph}{{\wp@mk@title\thewp}: \pdataref{wp}\wp@id{title}}%
\noindent\ignorespaces}
{\end{work@package}}
\newcommand\wptitle{\wp@mk@title{\wp@num}: \pdata@target{wp}{\wp@id}{\pdataref{wp}\wp@id{title}}}
\newcommand\wprm{\pdataref@safe{wp}\wp@id{RM}\if@RAM\ RM+\pdataref{wp}\wp@id{RAM} RAM\fi}
\newcount\site@contribution%
\newcommand\if@site@contributes[2]{%
\ifx\prop@gen@compactht\@true
\if@RAM\ifnum\pdataref@num\wp@id{#1}{RM} > 0 \ifnum \pdataref@num\wp@id{#1}{RAM} > 0 #2\fi\fi
\else\ifnum\pdataref@num\wp@id{#1}{RM} > 0 #2\fi\fi
\else #2\fi}
\newcounter{wp@sites@num}
\newcommand\wp@sites@efforts@lines{%
\setcounter{wp@sites@num}{0}
{\let\G@refundefinedtrue=\relax\let\@latex@warning=\relax\let\@sw\relax%
\let\site\relax\let\textbf\relax\let\sum@style\relax\let\lead@style\relax%
\let\pn\relax\let\sys\relax%
\xdef\wp@sites@line{\wp@legend@site}\xdef\wp@efforts@line{\wp@legend@effort}%initialize lines
\@for\@site:=\prop@gen@sites\do{\if@site@contributes\@site{\stepcounter{wp@sites@num}}%
\xdef\wp@sites@line{\wp@sites@line%
\if@site@contributes\@site{&%
\ifx\wp@swsites\@true%
\@sw{\ifx\@site\wp@lead\lead@style{\site{\@site}}\else\site{\@site}\fi}%
\else\ifx\@site\wp@lead\lead@style{\site{\@site}}\else\site{\@site}\fi%
\fi}}%
\xdef\wp@efforts@line{\wp@efforts@line%
\if@site@contributes\@site{&%
\ifx\@site\wp@lead%
\lead@style{\pdataref@safe\wp@id\@site{RM}\if@RAM+\pdataref@safe\wp@id\@site{RAM}\fi}
\else\pdataref@safe\wp@id\@site{RM}\if@RAM+\pdataref@safe\wp@id\@site{RAM}\fi\fi}}%
}% do
\xdef\wp@sites@line{\wp@sites@line&\sum@style{\wp@legend@all}}%
\xdef\wp@efforts@line{\wp@efforts@line&
\sum@style{\textbf{\pdataref{wp}\wp@id{RM}\if@RAM+\pdataref{wp}\wp@id{RAM}\fi}}}}}
\newcommand\wpheadertable{%
\wp@sites@efforts@lines%
\par\noindent\begin{tabular}{|l||l|*{\thewp@sites@num}{c|}|c|}\hline%
\textbf{\wp@mk@title{\wp@num}}&\wp@sites@line\\\hline%
\textsf{\pdata@target{wp}{\wp@id}{\pdataref{wp}\wp@id{title}}} &\wp@efforts@line\\\hline%
\end{tabular}\smallskip\par\noindent\ignorespaces}
\newcommand\wp@legend@site{Site}
\newcommand\wp@legend@effort{Effort\if@RAM{ (RM+RAM)}\fi}
\newcommand\wp@legend@all{\textbf{all}}
\newcounter{prop@RM}\if@RAM\newcounter{prop@RAM}\fi
\ifwork@areas
\newcounter{wa@RM}\if@RAM\newcounter{wa@RAM}\fi\newcounter{wa@wps}
\newenvironment{workarea}[1][]
{\setkeys{workarea}{#1}
\let\@wps=\relax
\stepcounter{wa}
\pdata@def{wa}{\wa@id}{label}{\wa@label\thewa}
\pdata@def{wa}{\wa@id}{number}{\thewa}
\pdata@def{wa}{\wa@id}{page}{\thepage}
\update@was{\wa@id}
\pdata@def{wa}{\wa@id}{num}{\thewa}
\setcounter{wa@RM}{0}\if@RAM\setcounter{wa@RAM}{0}\fi\setcounter{wa@wps}{0}
\edef\@@wps{\pdataref@aux\wa@id{wp}{ids}}
\@for\@wp:=\@@wps\do{\stepcounter{wa@wps}%
\if@sites
\@for\@site:=\prop@gen@sites\do{%
  \edef\@RM{\pdataref@num\@wp\@site{RM}}
  \if@RAM\edef\@RAM{\pdataref@num\@wp\@site{RAM}}\fi
  \addtocounter{wa@RM}{\@RM}\addtocounter{prop@RM}{\@RM}
  \if@RAM\addtocounter{wa@RAM}{\@RAM}\addtocounter{prop@RAM}{\@RAM}\fi}
\else
\edef\@RM{\pdataref@num{wp}\@wp{RM}}
\if@RAM\edef\@RAM{\pdataref@num{wp}\@wp{RAM}}\fi
\addtocounter{wa@RM}{\@RM}\addtocounter{prop@RM}{\@RM}
\if@RAM\addtocounter{wa@RAM}{\@RAM}\addtocounter{prop@RAM}{\@RAM}\fi
\fi}
\pdata@def{wa}\wa@id{RM}\thewa@RM
\pdata@def{prop}{all}{RM}\theprop@RM
\if@RAM
\pdata@def{wa}\wa@id{RAM}\thewa@RAM
\pdata@def{prop}{all}{RAM}\theprop@RAM
\fi
\subsubsection*{{\wa@mk@title\thewa}: {\pdata@target{wa}\wa@id{\pdataref{wa}\wa@id{title}}}}
\addcontentsline{toc}{subsubsection}{{\wa@mk@title\thewa}: \pdataref{wa}\wa@id{title}}%
\ignorespaces}
{\@ifundefined{@wps}{}{\pdata@def\wa@id{wp}{ids}\@wps}\pdata@def\wa@id{wp}{count}\thewa@wps}\fi
\ifdelivs\newwrite\wpg@delivs\fi
\newenvironment{workplan}%
{\ifdelivs\immediate\openout\wpg@delivs=\jobname.delivs\fi
\ifwork@areas\let\@was=\relax\else\let\@wps=\relax\fi}%
{\@ifundefined{task@deps}{}{\pdata@def{all}{task}{deps}{\task@deps}}
\pdata@def{all}{task}{count}{\thealltasks}
\ifwork@areas
\@ifundefined{@was}{}{\pdata@def{all}{wa}{ids}\@was}
\else
\@ifundefined{@wps}{}{\pdata@def{all}{wp}{ids}\@wps}
\fi
\ifdelivs\@ifundefined{mile@stones}{}
{\@for\@I:=\mile@stones\do{%
\pdata@def{mile}\@I{delivs}{\@ifundefined{\@I delivs}{}{\csname\@I delivs\endcsname}}}}\fi
\ifwork@areas\pdata@def{all}{wa}{count}{\thewa}\fi
\pdata@def{all}{wp}{count}{\theallwp}
\ifdelivs
\pdata@def{all}{deliverables}{count}{\thedeliverable}
\pdata@def{all}{milestones}{count}{\themilestone}
\fi
\ifdelivs\closeout\wpg@delivs\fi}
\newcommand\deliv@error{\PackageError{proposal}
{To use use deliverables, you have to specify the option 'deliverables'}}
\newenvironment{wpdelivs}{\begin{wp@delivs}}{\end{wp@delivs}}
\newenvironment{wp@delivs}
{\ifdelivs\textbf\deliv@legend@delivs:\\[-3ex]%
\begin{compactdesc}\else\deliv@error\fi}
{\ifdelivs\end{compactdesc}\fi}
\newcommand\deliv@legend@delivs{Deliverables}
\newenvironment{wadelivs}
{\textbf\deliv@legend@delivs:\\[-3ex]\begin{wp@delivs}}
{\end{wp@delivs}}
\newcommand\lec[1]{\strut\hfil\strut\null\nobreak\hfill\hbox{$\leadsto$#1}\par}
\newcommand\deliv@label[1]{D{#1}}
\newcommand\delivref[2]{\pdataRef{deliv}{#1#2}{label}}
\newcommand\localdelivref[1]{\delivref{\wp@id}{#1}}
\newcommand\delivtref[2]{\delivref{#1}{#2}: \pdataRefFB{deliv}{#1#2}{short}{title}}
\newcommand\localdelivtref[1]{\delivtref{\wp@id}{#1}}
\define@key{deliv}{id}{\def\deliv@id{#1}}
\define@key{deliv}{due}{\def\deliv@due{#1}}
\define@key{deliv}{dissem}{\def\deliv@dissem{#1}}
\define@key{deliv}{nature}{\def\deliv@nature{#1}}
\define@key{deliv}{miles}{\def\deliv@miles{#1}}
\define@key{deliv}{short}{\def\deliv@short{#1}}
\define@key{deliv}{lead}{\def\deliv@lead{#1}}
\newcounter{deliverable}
\newcommand{\wpg@deliv}[3]{% keys, title, type
\stepcounter{deliverable}
\let\deliv@miles=\relax% clean state
\def\@type{#3}\def\@wp{wp}% set up ifx
\def\wpg@id{\csname #3@id\endcsname}
\setkeys{deliv}{#1}\stepcounter{deliv}% set state
\ifx\@type\@wp\def\current@label{\deliv@label{\ifwork@areas\thewa.\fi\thewp.\thedeliv}}
\else\def\current@label{\deliv@label{\thewa.\thedeliv}}\fi
\pdata@def{deliv}{\wpg@id\deliv@id}{label}{\current@label}
\pdata@def{deliv}{\wpg@id\deliv@id}{title}{#2}
\@ifundefined{deliv@short}
{\pdata@def{deliv}{\wpg@id\deliv@id}{short}{#2}}
{\pdata@def{deliv}{\wpg@id\deliv@id}{short}{\deliv@short}}
\@ifundefined{deliv@nature}
{\protect\G@refundefinedtrue\@latex@warning{key 'nature' for Deliv \wpg@id undefined}}
{\pdata@def{deliv}{\wpg@id\deliv@id}{nature}{\deliv@nature}}
\@ifundefined{deliv@dissem}
{\protect\G@refundefinedtrue\@latex@warning{key 'dissem' for Deliv \wpg@id undefined}}
{\pdata@def{deliv}{\wpg@id\deliv@id}{dissem}{\deliv@dissem}}
\@ifundefined{deliv@lead}
{\protect\G@refundefinedtrue\@latex@warning{key 'lead' for Deliv \wpg@id  undefined}}
{\pdata@def{deliv}{\wpg@id\deliv@id}{lead}{\deliv@lead}}
\@ifundefined{deliv@due}{}{%
\@for\@I:=\deliv@due\do{\protected@write\wpg@delivs{}{\string\deliverable%
{\ifnum\@I<10 0\@I\else\@I\fi}% sort key
{\@I}% due date
{\current@label}% label
{\@ifundefined{deliv@id}{??}{\wpg@id\deliv@id}}% id
{\@ifundefined{deliv@dissem}{??}{\deliv@dissem}}% dissemination level
{\@ifundefined{deliv@nature}{??}{\deliv@nature}}% nature
{#2}
{\ifx\@type\@wp{WP\ifwork@areas\thewa.\fi\thewp}\else{WA\thewa}\fi}%WP
{\@ifundefined{deliv@lead}{??}{\string\site{\deliv@lead}}}}}}% lead
\item[\current@label\ (%
\delivs@legend@due: \@ifundefined{deliv@due}{??}{\deliv@due},
\delivs@legend@nature: \@ifundefined{deliv@nature}{??}{\deliv@nature},
\delivs@legend@dissem: \@ifundefined{deliv@dissem}{??}{\deliv@dissem},
\delivs@legend@lead: \@ifundefined{deliv@lead}{??}{\site{\deliv@lead}})]
 \pdata@target{deliv}{\wpg@id\deliv@id}{\textit{#2}}
\@ifundefined{deliv@miles}{}{% print the milestones and update their deliverables
\let\m@sep=\relax% do not print the separator the first time round
\lec{\@for\@I:=\deliv@miles\do{% Iterate over the milestones mentioned
\m@sep\pdataRef{mile}{\@I}{label}% print the milestone reference
\let\m@sep=,}}%set the separator for the next times
\def\d@sep{,}
 \@for\@I:=\deliv@miles\do{% Iterate over the milestones mentioned
 \expandafter\ifx\csname\@I delivs\endcsname\relax% Check that the miles@delivs is empty
  {\expandafter\xdef\csname\@I delivs\endcsname{\wpg@id\deliv@id}}% if so, skip the separator
   \else\expandafter\xdef\csname\@I delivs\endcsname%if not add it
      {\csname\@I delivs\endcsname\d@sep\wpg@id\deliv@id}\fi}}}
\newenvironment{wadeliv}[2][]{\ifdelivs\wpg@deliv{#1}{#2}{wa}\else\deliv@error\fi}{}
\newenvironment{wpdeliv}[2][]{\ifdelivs\wpg@deliv{#1}{#2}{wp}\else\deliv@error\fi}{}
\newcommand\milestone@label[1]{M{#1}}
\newcommand\mileref[1]{\pdataRef{mile}{#1}{label}}
\newcommand\miletref[1]{\mileref{#1}: \pdataRefFB{mile}{#1}{short}{title}}
\newcounter{milestone}
\define@key{milestone}{id}{\gdef\mile@id{#1}}
\define@key{milestone}{month}{\gdef\mile@month{#1}}
\define@key{milestone}{verif}{\gdef\mile@verif{#1}}
\newcommand\milestone[3][]{%
\ifdelivs%
\setkeys{milestone}{#1}\stepcounter{milestone}%
\pdata@def{mile}\mile@id{label}{\milestone@label{\themilestone}}%
\pdata@def{mile}\mile@id{month}{\mile@month}%
\pdata@def{mile}\mile@id{verif}{\mile@verif}%
\pdata@def{mile}\mile@id{title}{#2}%
\@ifundefined{mile@stones}{\xdef\mile@stones{\mile@id}}{\xdef\mile@stones{\mile@stones,\mile@id}}%
\@milestone{#1}{#2}{#3}% presentation
\else\deliv@error\fi}
\newcommand\@milestone[3]{%
\pdata@target{mile}\mile@id{\textbf{\milestone@label\themilestone}}&
\textbf{#2} &
\prop@milesfor\mile@id &
\pdataref{mile}\mile@id{month} &
\pdataref{mile}\mile@id{verif}\\\hline
\multicolumn{5}{|p{14cm}|}{#3}\\\hline\hline}
\newenvironment{milestones}{\begin{@milestones}}{\end{@milestones}}
\newenvironment{@milestones}
{\ifdelivs\begin{longtable}{|l|p{4cm}|p{5cm}|l|p{2.5cm}|}\hline
\#&\miles@legend@name&\miles@legend@involved&\miles@legend@month&\miles@legend@verif\\\hline\hline%
\else\deliv@error\fi}
{\ifdelivs\end{longtable}%
\footnotetext\miles@legend@footnote\fi}
\newcommand\miles@legend@name{Name}
\newcommand\miles@legend@month{Mo}
\newcommand\miles@legend@verif{Means of Verif.}
\newcommand\miles@legend@involved{WPs\footnotemark/Deliverables involved}
\newcommand\miles@legend@footnote{The work package number is the first number in the deliverable number.}
\newcommand\prop@milesfor[1]{\edef\@delivs{\pdataref@safe{mile}{#1}{delivs}}%
\let\m@sep=\relax\def\new@sep{,\ }%
\@for\@I:=\@delivs\do{\m@sep\pdataRef{deliv}\@I{label}\let\m@sep=\new@sep}}
\newcommand{\deliverable}[9]{\pdataRef{deliv}{#4}{label}&#7&#8&#9&#6&#5&#2\\\hline}%sortkey,due,label,id,title,type,level,lead
\newenvironment{deliverables}[1]{\ifdelivs\begin{longtable}{|l|p{#1}|l|l|l|l|l|}\hline%
\#&\textbf{\delivs@legend@name}&%
\textbf{\delivs@legend@wp}&%
\textbf{\delivs@legend@lead}&%
\textbf{\delivs@legend@nature}&%
\textbf{\delivs@legend@level}&%
\textbf{\delivs@legend@due}\\\hline\hline%
\endhead%
\else\deliv@error\fi}
{\ifdelivs\end{longtable}\fi}
\newcommand\delivs@legend@name{Deliverable name}
\newcommand\delivs@legend@wp{WP}
\newcommand\delivs@legend@nature{Type}
\newcommand\delivs@legend@level{Level}
\newcommand\delivs@legend@due{Due}
\newcommand\delivs@legend@dissem{Dissem.}
\newcommand\delivs@legend@lead{Lead}
\newcommand{\inputdelivs}[1]{%
\begin{deliverables}{#1}%
\IfFileExists{\jobname.deliverables}%
{\input{\jobname.deliverables}}%
{\IfFileExists{\jobname.delivs}{\input{\jobname.delivs}}{}}
\end{deliverables}}
\newenvironment{tasklist}
{\begin{compactenum}}{\end{compactenum}}
\newcommand\task@label[2]{\textbf{T#1.#2}}
\define@key{task}{id}{\def\task@id{#1}\@dmp{id=#1}}
\define@key{task}{wphases}{\def\task@wphases{#1}\pdata@def{task}{\taskin\task@id\wp@id}{wphases}{#1}\@dmp{wphases=#1}}
\define@key{task}{requires}{\@requires\task@id{#1}\@dmp{req=#1}}
\define@key{task}{title}{\def\task@title{#1}\pdata@def{task}{\taskin\task@id\wp@id}{title}{#1}}
\define@key{task}{lead}{\def\task@lead{#1}\pdata@def{task}{\taskin\task@id\wp@id}{lead}{#1}}
\define@key{task}{partners}{\def\task@partners{#1}\pdata@def{task}{\taskin\task@id\wp@id}{partners}{#1}}
\define@key{task}{PM}{\def\task@PM{#1}\pdata@def{task}{\taskin\task@id\wp@id}{PM}{#1}}
\def\task@set#1{\edef\task@id{task\thetask@all}
\def\task@wphases{0-0}\def\task@partners{}\def\task@lead{}\def\task@PM{}
\setkeys{task}{#1}}
\def\task@post@title@space{\quad}
\newcounter{alltasks}
\def\task@post@title@space{\quad}
\newcommand\task@legend@partners{Sites: }
\newcommand\task@legend@PM{PM}
\newenvironment{task}[1][]%
{\stepcounter{alltasks}
\@task{#1}\item[\pdata@target{task}{\taskin\task@id\wp@id}{\task@label\thewp\thetask@wp}]%
\@ifundefined{task@title}{}{\textbf\task@title}\task@post@title@space%
\def\@initial{0-0}\ifx\task@wphases\@initial\else%
\let\@@sep=\relax\@for\@I:=\task@wphases%
\do{\decode@wphase\@I\@@sep\show@wphase\wphase@start\wphase@end\wphase@force\let\@@sep=\sep@wphases}%
\fi% initial
\hfill%
\ifsubmit\else\ifx\task@PM\@empty\else\task@PM\ \task@legend@PM;\fi\fi%
\ifx\task@lead\@empty\else\ \task@legend@partners\site\task@lead~(\legend@lead)\fi%
\@for\@I:=\task@partners\do{, \site\@I}\\}
{\ignorespaces}
\newcommand\month@label[1]{M#1}
\newcommand\show@wphase[3]{\def\@test{#3}\month@label{#1}-\month@label{#2}%
\ifx\@test\@empty\@ #3}
\newcommand\sep@wphases{; }
\newcommand\legend@partners{Partners}
\newcommand\legend@lead{lead}
\newcommand\task@label@long{Task}
\newcounter{task@all}\newcounter{task@wp}[wp]
\newcount\task@@end
\def\@task#1{\stepcounter{task@all}\stepcounter{task@wp}%
\task@set{#1}%
\pdata@def{task}{\taskin\task@id\wp@id}{wphases}\task@wphases
\pdata@def{task}{\taskin\task@id\wp@id}{label}{\task@label\thewp\thetask@wp}%
\pdata@def{task}{\taskin\task@id\wp@id}{number}{\thetask@wp}%
\pdata@def{task}{\taskin\task@id\wp@id}{page}{\thepage}%
\update@tasks{\taskin\task@id\wp@id}}
\newcommand\workphase[1]{\PackageError{proposal}
  {The \protect\workphase macro is deprecated,\MessageBreak
    use the attributes wphase on the workpackage environment instead!}}
\newcommand\taskin[2]{#2@#1}
\newcommand\taskref[2]{\pdataRef{task}{#1@#2}{label}}
\newcommand\taskreflong[2]{\pdataRef{task}{#2}{label}}
\newcommand\tasktref[2]{\taskref{#1}{#2}: \pdataRefFB{task}{#1@#2}{short}{title}}
\newcommand\localtaskref[1]{\taskref{\wp@id}{#1}}
\newcommand\localtasktref[1]{\tasktref{\wp@id}{#1}}
\newcounter{gantt@deps}
\def\@requires#1#2{\stepcounter{gantt@deps}%
\edef\dep@id{taskdep\thegantt@deps}%
\pdata@def{taskdep}\dep@id{from}{\taskin{#1}\wp@id}%
\pdata@def{taskdep}\dep@id{to}{#2}%
\update@deps\dep@id}
\newcommand\prop@lead[1]{\@ifundefined{wp@#1@lead}%
{\protect\G@refundefinedtrue\@latex@warning{lead for WP #1 undefined}??}%
{\csname wp@#1@lead\endcsname}}
\definecolorset{gray/rgb/hsb/cmyk}{}{}%
{leadgray,.90/.90,.90,.90/0,0,.90/0,0,0,.10;%
wagray,.70/.70,.70,.70/0,0,.70/0,0,0,.30}
\newcommand\sum@style[1]{\cellcolor{wagray}{\textbf{#1}}}
\newcommand\wa@style[1]{\cellcolor{wagray}{\textbf{#1}}}
\newcommand\wp@style[1]{#1}
\newcommand\lead@style[1]{\cellcolor{leadgray}{\textit{#1}}}
\newcommand\wp@lead@style@explained{light gray italicised}
\newcounter{wpfig@options}
\define@key{wpfig}{size}{\def\wpfig@size{#1}\@dmp{size=#1}}
\def\@true{true}
\def\wpfig@pages{false}
\define@key{wpfig}{pages}[true]{\def\wpfig@pages{#1}\stepcounter{wpfig@options}}
\def\wpfig@type{false}
\define@key{wpfig}{type}[true]{\def\wpfig@type{#1}\stepcounter{wpfig@options}}
\def\wpfig@start{false}
\define@key{wpfig}{start}[true]{\def\wpfig@start{#1}\stepcounter{wpfig@options}}
\def\wpfig@length{false}
\define@key{wpfig}{length}[true]{\def\wpfig@length{#1}\stepcounter{wpfig@options}}
\def\wpfig@end{false}
\define@key{wpfig}{end}[true]{\def\wpfig@end{#1}\stepcounter{wpfig@options}}
\define@key{wpfig}{label}{\def\wpfig@label{#1}}
\define@key{wpfig}{caption}{\def\wpfig@caption{#1}}
\def\@sw#1{\begin{sideways}#1\end{sideways}}
\newenvironment{wp@figure}{\begin{figure}[ht]\wpfig@style\begin{center}
{\let\@sw\relax\let\textbf\relax\let\site\relax\let\pn\relax\let\sys\relax%
\gdef\wpfig@headline{\wpfig@legend@wap&\wpfig@legend@title%
\ifx\wpfig@type\@true&\wpfig@legend@type\fi%
\ifx\wpfig@pages\@true&\@sw{\wpfig@legend@page}\fi%
\ifx\wpfig@start\@true&\@sw{\wpfig@legend@start}\fi%
\ifx\wpfig@length\@true&\@sw{\wpfig@legend@length}\fi
\ifx\wpfig@end\@true&\@sw{\wpfig@legend@end}\fi}%
\if@sites%
\@for\@site:=\prop@gen@sites\do{%
\xdef\wpfig@headline{\wpfig@headline&\@sw{\wpfig@legend@siteRM{\@site}}}%
\if@RAM\xdef\wpfig@headline{\wpfig@headline&\@sw{\wpfig@legend@siteRAM{\@site}}}\fi}%
\xdef\wpfig@headline{\wpfig@headline&\@sw{\wpfig@legend@totalRM}}%
\if@RAM\xdef\wpfig@headline{\wpfig@headline&\@sw{\wpfig@legend@totalRAM}}\fi%
\else% if@sites
\xdef\wpfig@headline{\wpfig@headline &\@sw{\wpfig@legend@RM}\if@RAM&\@sw{\wpfig@legend@RAM}\fi}
\fi}%if@sites
\if@RAM\begin{tabular}{|l|l|*{\thewpfig@options}{r|}*{\the@sites}{r|r|}|r|r|}\hline
\else\begin{tabular}{|l|l|*{\thewpfig@options}{r|}|*{\the@sites}{r|}|r|}\hline\fi%|
\wpfig@headline\\\hline\hline}
{\end{tabular}\smallskip\\
\wpfig@legend@RAM@expl
\if@sites; \wpfig@legend@lead@expl\fi
\@ifundefined{wpfig@label}{\caption{\wpfig@legend@caption}}{\caption{\wpfig@caption}}
\@ifundefined{wpfig@label}{\label{fig:wplist}}{\label{\wpfig@label}}
\end{center}\end{figure}}
\newcommand\wpfig@legend@wap{\textbf{\ifwork@areas{WA/P}\else{WP}\fi}}
\newcommand\wpfig@legend@title{\textbf{Title}}
\newcommand\wpfig@legend@type{\textbf{type}}
\newcommand\wpfig@legend@page{\textbf{page}}
\newcommand\wpfig@legend@start{\textbf{start}}
\newcommand\wpfig@legend@length{\textbf{length}}
\newcommand\wpfig@legend@end{\textbf{end}}
\newcommand\wpfig@legend@siteRM[1]{\site{#1}\if@RAM\ RM\fi}
\newcommand\wpfig@legend@siteRAM[1]{\site{#1}\ RAM}
\newcommand\wpfig@legend@totalRM{total\if@RAM\ RM\fi}
\newcommand\wpfig@legend@totalRAM{total RAM}
\newcommand\wpfig@legend@RM{RM}
\newcommand\wpfig@legend@RAM{RAM}
\newcommand\wpfig@legend@RAM@expl{\if@RAM R(A)M $\widehat=$ Researcher (Assistant) Months\else\ Efforts in PM\fi}
\newcommand\wpfig@legend@lead@expl{WP lead efforts \wp@lead@style@explained}
\newcommand\wpfig@legend@caption{{\ifwork@areas Work Areas and \fi}Work Packages}
\def\wpfig@style{}
\newcommand\wpfigstyle[1]{\def\wpfig@style{#1}}
\newcount\local@count
\newcount\@@@RM\if@RAM\newcount\@@@RAM\fi
\newcount\all@@@RM\if@RAM\newcount\all@@@RAM\fi
\newcommand{\wpfig}[1][]{\setcounter{wpfig@options}{0}\setkeys{wpfig}{#1}
{\gdef\@wp@lines{}%initialize
\let\tabularnewline\relax\let\hline\relax\let\lead@style\relax% so they
\let\wa@style\relax\let\wp@style\relax \let\@sw\relax\let\textbf\relax% do not
\let\G@refundefinedtrue=\relax\let\@latex@warning=\relax\let\hyperlink=\relax% bother
\let\pn\relax\let\xspace\relax% us
\ifwork@areas
\edef\@@was{\pdataref@safe{all}{wa}{ids}}%
\@for\@@wa:=\@@was\do{% iterate over the work areas
\xdef\@@wa@line{\wa@style{\pdataRef{wa}\@@wa{label}}%
&\wa@style{\@ifundefined{wa@\@@wa @short}{\pdataref{wa}\@@wa{title}}{\pdataref{wa}\@@wa{short}}}%
\ifx\wpfig@type\@true&\wa@style{\pdataref{wa}\@@wa{type}}\fi%
\ifx\wpfig@pages\@true&\wa@style{\pdataref{wa}\@@wa{page}}\fi%
\ifx\wpfig@start\@true&\wa@style{\pdataref{wa}\@@wa{start}}\fi%
\ifx\wpfig@length\@true&\wa@style{\pdataref{wa}\@@wa{len}}\fi%
\ifx\wpfig@end\@true&\wa@style{\pdataref{wa}\@@wa{end}}\fi}
\if@sites
\@for\@site:=\prop@gen@sites\do{%
\edef\@@wps{\pdataref@safe\@@wa{wp}{ids}}%
\local@count 0%
\@for\@@wp:=\@@wps\do{\advance\local@count by \pdataref@num\@@wp\@site{RM}}%
\pdata@def\@@wa\@site{RM}{\the\local@count}%
\xdef\@@wa@line{\@@wa@line&\wa@style{\the\local@count}}%
\if@RAM
\local@count 0%
\@for\@@wp:=\@@wps\do{\advance\local@count by \pdataref@num\@@wp\@site{RAM}}
\pdata@def\@@wa\@site{RAM}{\the\local@count}%
\xdef\@@wa@line{\@@wa@line&\wa@style{\the\local@count}}%
\fi}
\local@count0\relax%
\@for\@site:=\prop@gen@sites\do{\global\advance\local@count by \pdataref@num\@@wa\@site{RM}}%
\xdef\@@wa@line{\@@wa@line &\wa@style{\textbf{\the\local@count}}}
\if@RAM
\local@count0\relax%
\@for\@site:=\prop@gen@sites\do{\global\advance\local@count by \pdataref@num\@@wa\@site{RAM}}%
\xdef\@@wa@line{\@@wa@line &\wa@style{\textbf{\the\local@count}}}
\fi
\else% if@sites
\edef\@@wps{\pdataref@safe{all}{wp}{ids}}%
\xdef\@@wa@line{\@@wa@line&\wa@style{\pdataref{wa}\@@wa{RM}}
\if@RAM&\wa@style{\pdataref{wa}\@@wa{RAM}}\fi}%
\fi% if@sites
\xdef\@wp@lines{\@wp@lines\@@wa@line\tabularnewline\hline}% add the line for the workarea
\edef\@@wps{\pdataref@safe\@@wa{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% iterate over its work packages
\xdef\@@wp@line{\pdataRef{wp}\@@wp{label}%
&\@ifundefined{wp@\@@wp @short}{\pdataref{wp}\@@wp{title}}{\pdataref{wp}\@@wp{short}}%
\ifx\wpfig@type\@true&\pdataref{wp}\@@wp{type}\fi%
\ifx\wpfig@pages\@true&\pdataref{wp}\@@wp{page}\fi%
\ifx\wpfig@start\@true&\pdataref{wp}\@@wp{start}\fi%
\ifx\wpfig@length\@true&\pdataref{wp}\@@wp{len}\fi%
\ifx\wpfig@end\@true&\pdataref{wp}\@@wp{end}\fi}
\if@sites
\@for\@site:=\prop@gen@sites\do{%
\edef\@@lead{\pdataref@safe{wp}\@@wp{lead}}
\edef\@@RM{\ifx\@@lead\@site\lead@style{\pdataref@safe\@@wp\@site{RM}}\else\wp@style{\pdataref@safe\@@wp\@site{RM}}\fi}
\xdef\@@wp@line{\@@wp@line&\@@RM}
\if@RAM
\edef\@@RAM{\ifx\@@lead\@site\lead@style{\pdataref@safe\@@wp\@site{RAM}}\else\wp@style{\pdataref@safe\@@wp\@site{RAM}}\fi}
\xdef\@@wp@line{\@@wp@line&\@@RAM}
\fi}
\local@count0\relax%
\@for\@site:=\prop@gen@sites\do{\global\advance\local@count by \pdataref@num\@@wp\@site{RM}}%
\xdef\@@wp@line{\@@wp@line &\textbf{\the\local@count}}
\if@RAM
\global\local@count0\relax%
\@for\@site:=\prop@gen@sites\do{\global\advance\local@count by \pdataref@num\@@wp\@site{RAM}}%
\xdef\@@wp@line{\@@wp@line &\textbf{\the\local@count}}
\fi% if@sites
\else% if@sites
\xdef\@@wp@line{\@@wp@line&\wp@style{\pdataref@safe{wp}\@@wp{RM}}}
\if@RAM\xdef\@@wp@line{\@@wp@line&\wp@style{\pdataref@safe{wp}\@@wp{RAM}}}\fi
\fi% if@sites
\xdef\@wp@lines{\@wp@lines\@@wp@line\tabularnewline\hline}}}
\else% ifwork@areas
\edef\@@wps{\pdataref@safe{all}{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% iterate over its work packages
\xdef\@@wp@line{\pdataRef{wp}\@@wp{label}%
&\@ifundefined{wp@\@@wp @short}{\pdataref{wp}\@@wp{title}}{\pdataref{wp}\@@wp{short}}
\ifx\wpfig@type\@true&\pdataref{wp}\@@wp{type}\fi%
\ifx\wpfig@pages\@true&\pdataref{wp}\@@wp{page}\fi%
\ifx\wpfig@start\@true&\pdataref{wp}\@@wp{start}\fi%
\ifx\wpfig@length\@true&\pdataref{wp}\@@wp{len}\fi%
\ifx\wpfig@end\@true&\pdataref{wp}\@@wp{end}\fi}
\if@sites
\@for\@site:=\prop@gen@sites\do{%
\edef\@@lead{\pdataref@safe{wp}\@@wp{lead}}
\edef\@@RM{\ifx\@@lead\@site\lead@style{\pdataref@safe\@@wp\@site{RM}}\else\wp@style{\pdataref@safe\@@wp\@site{RM}}\fi}
\xdef\@@wp@line{\@@wp@line&\@@RM}
\if@RAM
\edef\@@RAM{\ifx\@@lead\@site\lead@style{\pdataref@safe\@@wp\@site{RAM}}\else\wp@style{\pdataref@safe\@@wp\@site{RAM}}\fi}
\xdef\@@wp@line{\@@wp@line&\wp@style\@@RAM}
\fi}
\global\local@count0\relax%
\@for\@site:=\prop@gen@sites\do{\global\advance\local@count by \pdataref@num\@@wp\@site{RM}}%
\xdef\@@wp@line{\@@wp@line &\textbf{\the\local@count}}
\if@RAM
\global\local@count0\relax%
\@for\@site:=\prop@gen@sites\do{\global\advance\local@count by \pdataref@num{#1}\@site{RAM}}%
\xdef\@@wp@line{\@@wp@line &\textbf{\the\local@count}}
\fi
\else% if@sites
\xdef\@@wp@line{\@@wp@line&\wp@style{\pdataref@safe{wp}\@@wp{RM}}}
\if@RAM\xdef\@@wp@line{\@@wp@line&\wp@style{\pdataref@safe{wp}\@@wp{RAM}}\fi}
\fi% if@sites
\xdef\@wp@lines{\@wp@lines\@@wp@line\tabularnewline\hline}}
\fi%ifwork@areas
\gdef\@totals{}
\ifwork@areas
\if@sites
\@for\@site:=\prop@gen@sites\do{% iterate over the sites
\@@@RM=0\if@RAM\@@@RAM=0\fi
\edef\@@was{\pdataref@safe{all}{wa}{ids}}%
\@for\@@wa:=\@@was\do{% iterate over the work areas
\edef\@@wps{\pdataref@safe\@@wa{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% iterate over the work packages
\advance\@@@RM by \pdataref@num\@@wp\@site{RM}%
\if@RAM\advance\@@@RAM by \pdataref@num\@@wp\@site{RAM}\fi}}
\pdata@def{all}\@site{RM}{\the\@@@RM}\if@RAM\pdata@def{all}\@site{RAM}{\the\@@@RAM}\fi
\advance\all@@@RM by \the\@@@RM\if@RAM\advance\all@@@RAM by \the\@@@RAM\fi
\xdef\@totals{\@totals & \textbf{\the\@@@RM}\if@RAM& \textbf{\the\@@@RAM}\fi}}
\xdef\@totals{\@totals & \textbf{\the\all@@@RM}\if@RAM&\textbf{\the\all@@@RAM}\fi}
\pdata@def{all}{total}{RM}{\the\all@@@RM}\if@RAM\pdata@def{all}{total}{RAM}{\the\all@@@RAM}\fi
\else% if@sites
\@@@RM=0\if@RAM\@@@RAM=0\fi
\edef\@@was{\pdataref@safe{all}{wa}{ids}}%
\@for\@@wa:=\@@was\do{\edef\@@wps{\pdataref@safe\@@wa{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% iterate over the work packages
\advance\@@@RM by \pdataref@num{wp}\@@wp{RM}%
\if@RAM\advance\@@@RAM by \pdataref@num{wp}\@@wp{RAM}\fi}}
\pdata@def{all}{total}{RM}{\the\@@@RM}\if@RAM\pdata@def{all}{total}{RAM}{\the\@@@RAM}\fi
\xdef\@totals{&\the\@@@RM\if@RAM &\the\@@@RAM\fi}
\fi% if@sites
\else%i.e. no work@areas
\if@sites
\@for\@site:=\prop@gen@sites\do{%iterate over the sites
\@@@RM=0\if@RAM\@@@RAM=0\fi%
\edef\@@wps{\pdataref@safe{all}{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% iterate over the work packages
\advance\@@@RM by \pdataref@num\@@wp\@site{RM}%
\if@RAM\advance\@@@RAM by \pdataref@num\@@wp\@site{RAM}\fi}
\pdata@def{all}\@site{RM}{\the\@@@RM}\if@RAM\pdata@def{all}\@site{RAM}{\the\@@@RAM}\fi
\xdef\@totals{\@totals & \textbf{\the\@@@RM}\if@RAM& \textbf{\the\@@@RAM}\fi}
\advance\all@@@RM by \the\@@@RM\if@RAM\advance\all@@@RAM by \the\@@@RAM\fi}
\xdef\@totals{\@totals &\textbf{\the\all@@@RM}\if@RAM&\textbf{\the\all@@@RAM}\fi}
\pdata@def{all}{total}{RM}{\the\all@@@RM}\if@RAM\pdata@def{all}{total}{RAM}{\the\all@@@RAM}\fi
\else% if@sites
\@@@RM=0\if@RAM\@@@RAM=0\fi
\edef\@@wps{\pdataref@safe{all}{wp}{ids}}%
\@for\@@wp:=\@@wps\do{% iterate over the work packages
\advance\@@@RM by \pdataref@num{wp}\@@wp{RM}%
\if@RAM\advance\@@@RAM by \pdataref@num{wp}\@@wp{RAM}\fi}
\pdata@def{all}{total}{RM}{\the\@@@RM}\if@RAM\pdata@def{all}{total}{RAM}{\the\@@@RAM}\fi
\xdef\@totals{&\the\@@@RM\if@RAM &\the\@@@RAM\fi}
\fi% if@sites
\fi
\gdef\intended@totals{}\gdef\requested@totals{}
\if@sites
\@for\@site:=\prop@gen@sites\do{
\xdef\intended@totals{\intended@totals&\textbf{\pdataref@safe{site}\@site{intendedRM}}}
\xdef\requested@totals{\requested@totals&\pdataref@safe{site}\@site{reqPM}}
\if@RAM\xdef\intended@totals{\intended@totals&\textbf{\pdataref@safe{site}\@site{intendedRAM}}}\fi}
\if@RAM\xdef\intended@totals{\intended@totals&&}\else%
\xdef\intended@totals{\intended@totals&}%
\xdef\requested@totals{\requested@totals&}%
\fi
\else% if@sites
\xdef\intended@totals{\intended@totals&\textbf{\pdataref@safe{all}{intended}{RM}}}
\if@RAM\xdef\intended@totals{\intended@totals&\textbf{\pdataref@safe{all}{intended}{RAM}}}\fi
\fi}% if@sites
\local@count\thewpfig@options\advance\local@count by 2
\begin{wp@figure}
\@wp@lines\hline%
\multicolumn{\the\local@count}{|c|}{\prop@legend@totals}\@totals\\\hline%
\ifsubmit\else%
\ifx\prop@gen@topdownPM\@true%
\multicolumn{\the\local@count}{|c|}{\prop@legend@intendedtotals}\intended@totals\\\hline%
\fi% topdownPM
\ifx\prop@gen@botupPM\@true%
\multicolumn{\the\local@count}{|c|}{\prop@legend@requestedtotals}\requested@totals\\\hline%
\fi% botupPM
\fi% submit
\end{wp@figure}}
\newcommand\prop@legend@totals{\textbf{totals}}
\newcommand\prop@legend@intendedtotals{\textbf{intended totals}}
\newcommand\prop@legend@requestedtotals{\textbf{requested totals}}
\newif\ifgantt@draft\gantt@draftfalse
\define@key{gantt}{xscale}{\def\gantt@xscale{#1}}
\define@key{gantt}{yscale}{\def\gantt@yscale{#1}}
\define@key{gantt}{step}{\def\gantt@step{#1}}
\define@key{gantt}{size}{\def\gantt@size{#1}}
\define@key{gantt}{draft}[true]{\ifsubmit\else\gantt@drafttrue\fi}
\def\gantt@set#1{\gantt@draftfalse\def\gantt@xscale{1}\def\gantt@yscale{.35}\def\gantt@step{3}
\setkeys{gantt}{#1}}
\newenvironment{gantt}[2][]
{\gantt@set{#1}
\def\@test{\prop@gen@months@default}
\ifx\@test\prop@gen@months
\ClassError{proposal}{Need overall project months to draw gantt
    chart - expect trouble;\MessageBreak specify
    \protect\begin{proposal}[...,months=??,...] to fix}\fi
\@ifundefined{gantt@size}{}{\csname\gantt@size\endcsname}
\newdimen\gantt@ymonths
\gantt@ymonths=#2 cm
\advance\gantt@ymonths by .5cm
\begin{tikzpicture}[xscale=\gantt@xscale,yscale=\gantt@yscale]
\draw[xstep=\gantt@step,gray,very thin] (0,0) grid (\prop@gen@months,#2);
\foreach \x in {0,\gantt@step,...,\prop@gen@months} \node at (\x,\gantt@ymonths) {\x};}
{\end{tikzpicture}}
\newdimen\gantt@ymid\newdimen\gantt@yinc\newdimen\gantt@xend
\newcommand{\@action}[5]{%
\gantt@ymid=#2 cm\gantt@yinc=\gantt@yscale cm
\gantt@xend=#3 cm\advance\gantt@xend by #4 cm
\advance\gantt@ymid by \gantt@yinc
\fill (#3,#2) rectangle +(#4,#5);
\node (#1@left) at (#3,\gantt@ymid) {};
\node (#1@right) at (\gantt@xend,\gantt@ymid) {};}
\def\@dependency#1#2{\draw[->,line width=2pt,color=red] (#1@right) -- (#2@left);}
\newcommand\gantt@compute@effort[3]{% start, len, force
  \@@e=#1\advance\@@e by #2
  \ifnum\thegantt@month<#1\else
  \ifnum\thegantt@month<\@@e
  \gantt@plus=#3cm\advance\gantt@effort by \gantt@plus\fi\fi}
\newcommand{\ganttchart}[1][]{\begin{figure}[ht]\centering
\gantt@set{#1}
\def\gantt@wps{\pdataref@num{all}{wp}{count}}
\begin{gantt}[#1]{\gantt@wps}
 \newcounter{taskwps}\newcount\@@line
 \edef\@@was{\pdataref@safe{all}{wa}{ids}}
 \ifwork@areas
 \@for\@@wa:=\@@was\do{% iterate over work areas
   \edef\@@wps{\pdataref@safe\@@wa{wp}{ids}}
   \@for\@@wp:=\@@wps\do{% iterate over work packages
     \stepcounter{taskwps}
     \@@line=\gantt@wps\advance\@@line by -\thetaskwps
     \edef\@@tasks{\pdataref@safe\@@wp{task}{ids}}
     \node at (-1/\gantt@xscale,\@@line) [above=-2pt] {\pdataRef{wp}\@@wp{label}};
     \edef\@@wphases{\pdataref@safe{wp}\@@wp{wphases}}
     \@for\@@ft:=\@@wphases\do{%wp-level work phases
       \decode@wphase\@@ft
       \@action\@@wp\@@line\wphase@start\wphase@len\wphase@force}
     \@for\@@task:=\@@tasks\do{% tasks
       \edef\@@wphases{\pdataref@safe{task}\@@task{wphases}}
       \@for\@@ft:=\@@wphases\do{%task-level work phases
         \decode@wphase\@@ft
         \@action\@@task\@@line\wphase@start\wphase@len\wphase@force}}}}
 \else% ifwork@areas false
 \edef\@@wps{\pdataref@safe{all}{wp}{ids}}
 \@for\@@wp:=\@@wps\do{% iterate over work packages
   \stepcounter{taskwps}
   \@@line=\gantt@wps\advance\@@line by -\thetaskwps
   \edef\@@tasks{\pdataref@safe\@@wp{task}{ids}}
   \node at (-1/\gantt@xscale,\@@line) [above=-2pt] {\pdataRef{wp}\@@wp{label}};
   \edef\@@wphases{\pdataref@safe{wp}\@@wp{wphases}}
   \@for\@@ft:=\@@wphases\do{%iterate over the wp-level work phases
     \decode@wphase\@@ft
     \@action\@@wp\@@line\wphase@start\wphase@len\wphase@force}
   \@for\@@task:=\@@tasks\do{% task-level work phases
     \edef\@@wphases{\pdataref@safe{task}\@@task{wphases}}
     \@for\@@ft:=\@@wphases\do{%iterate over the task-level work phases
       \decode@wphase\@@ft
       \@action\@@task\@@line\wphase@start\wphase@len\wphase@force}}}
 \fi% ifwork@areas end
 \edef\@@deps{\pdataref@safe{all}{task}{deps}}
 \@for\@@dep:=\@@deps\do{%
   \@dependency{\pdataref@safe{taskdep}\@@dep{from}}{\pdataref@safe{taskdep}\@@dep{to}}}
 \ifgantt@draft
    \newcounter{gantt@month}
    \newcount\@@e\newdimen\gantt@effort\newdimen\gantt@plus
    \@whilenum\thegantt@month<\prop@gen@months\do{% step over months
      \gantt@effort=0cm
      \ifwork@areas
      \edef\@@was{\pdataref@safe{all}{wa}{ids}}
      \@for\@@wa:=\@@was\do{% iterate over work areas
        \edef\@@wps{\pdataref@safe\@@wa{wp}{ids}}
        \@for\@@wp:=\@@wps\do{% iterate over work packages
          \edef\@@wphases{\pdataref@safe{wp}\@@wp{wphases}}
          \@for\@@ft:=\@@wphases\do{%iterate over the wp-level work phases
            \decode@wphase\@@ft
            \gantt@compute@effort\wphase@start\wphase@len\wphase@force}
          \edef\@@tasks{\pdataref@safe\@@wp{task}{ids}}
          \@for\@@task:=\@@tasks\do{% iterate over tasks
          \edef\@@wphases{\pdataref@safe{task}\@@task{wphases}}
          \@for\@@ft:=\@@wphases\do{%iterate over the wp-level work phases
            \decode@wphase\@@ft
            \gantt@compute@effort\wphase@start\wphase@len\wphase@force}}}}
      \fill  (\thegantt@month,-5) rectangle +(1,\gantt@effort);
      \else% ifwork@areas
      \edef\@@wps{\pdataref@safe{all}{wp}{ids}}
      \@for\@@wp:=\@@wps\do{% iterate over work packages
          \edef\@@wphases{\pdataref@safe{wp}\@@wp{wphases}}
          \@for\@@ft:=\@@wphases\do{%iterate over the wp-level work phases
            \decode@wphase\@@ft
            \gantt@compute@effort\wphase@start\wphase@len\wphase@force}
          \edef\@@tasks{\pdataref@safe\@@wp{task}{ids}}
          \@for\@@task:=\@@tasks\do{% iterate over tasks
          \edef\@@wphases{\pdataref@safe{task}\@@task{wphases}}
          \@for\@@ft:=\@@wphases\do{%iterate over the wp-level work phases
            \decode@wphase\@@ft
            \gantt@compute@effort\wphase@start\wphase@len\wphase@force}}}
      \fill  (\thegantt@month,-5) rectangle +(1,\gantt@effort);
      \fi% ifwork@areas
      \stepcounter{gantt@month}}
   \fi% ifgantt@draft
  \end{gantt}
  \caption{\gantt@caption}\label{fig:gantt}
\end{figure}}
\newcommand\gantt@caption@main{Overview Work Package Activities}
\newcommand\gantt@caption@lower{lower bar shows the overall effort \if@RAM (RAM only)\fi per month}
\newcommand\gantt@caption{\gantt@caption@main\ifgantt@draft\xspace (\gantt@caption@lower)\fi}
\newcommand{\gantttaskchart}[1][]{\begin{figure}[ht]\centering\gantt@set{#1}
\def\gantt@tasks{\pdataref@num{all}{task}{count}}
\begin{gantt}[#1]{\gantt@tasks}
  \newcounter{gantt@tasks}\newcount\@@line
  \edef\@@wps{\pdataref@safe{all}{wp}{ids}}
   \@for\@@wp:=\@@wps\do{% iterate over work packages
     \edef\@@tasks{\pdataref@safe\@@wp{task}{ids}}
     \@for\@@task:=\@@tasks\do{% iterate over the tasks
       \stepcounter{gantt@tasks}
       \@@line=\gantt@tasks\advance\@@line by -\thegantt@tasks
       \node at (-.5/\gantt@xscale,\@@line) [above=-2pt] {{\footnotesize\taskreflong\@@wp\@@task}};
       \edef\@@wphases{\pdataref@safe{task}\@@task{wphases}}
       \@for\@@ft:=\@@wphases\do{%iterate over the task-level work phases
         \decode@wphase\@@ft
         \@action\@@task\@@line\wphase@start\wphase@len\wphase@force
      }}}% end all iterations
    \end{gantt}
    \caption{\gantt@caption@main}\label{fig:gantt}
\end{figure}}
\newcommand\jpub{\textcolor{\prop@link@color}{\textbf{\large{$\star$}}}}
\newcommand\jpro{\textcolor{\prop@link@color}{\textbf{\large{$\bullet$}}}}
\newcommand\jorga{\textcolor{\prop@link@color}{\textbf{\large{$\circ$}}}}
\newcommand\add@joint[3]{\@ifundefined{coherence@#1@#2}%
{\@namedef{coherence@#1@#2}{#3}}%
{\expandafter\g@addto@macro\csname coherence@#1@#2\endcsname{#3}}}
\newcommand\prop@joint[2]{\@for\@first:=#2\do{%
\@for\@second:=#2\do{\ifx\@first\@second\else\add@joint\@first\@second{#1}\fi}}}
\newcommand\jointproj[1]{\prop@joint\jpro{#1}}
\newcommand\jointpub[1]{\prop@joint\jpub{#1}}
\newcommand\jointorga[1]{\prop@joint\jorga{#1}}
\newcommand{\coherencematrix}{
{\let\tabularnewline\relax\let\hline\relax\let\site\relax% so they do
 \let\@sw\relax\let\jpub\relax\let\jpro\relax\let\jorga\relax% not bother us
\gdef\@ct@head{}
\@for\@site:=\prop@gen@sites\do{\xdef\@ct@head{\@ct@head &\site{\@site}}}
\gdef\@ct@lines{\@ct@head\tabularnewline\hline\hline} %initialize with head line
\@for\@site:=\prop@gen@sites\do{\xdef\@ct@line{\site{\@site}}
  \@for\@@site:=\prop@gen@sites\do{
    \xdef\@ct@line{\@ct@line&\ifx\@site\@@site{X}\fi
      \@ifundefined{coherence@\@site @\@@site}{}{\@nameuse{coherence@\@site @\@@site}}}}
  \xdef\@ct@lines{\@ct@lines\@ct@line\tabularnewline\hline}}}
\begin{tabular}{|l||*{\the@site}{c|}}\hline
\@ct@lines\hline
joint&\multicolumn{\the@site}{l|}{\jpub $\hat=$ publication, \jpro $\hat=$ project,
  \jorga $\hat=$ organization}\\\hline
\end{tabular}}
\newcommand\coherencetable{%
\begin{table}[ht]
\begin{center}\small\setlength{\tabcolsep}{.5em}
\renewcommand{\arraystretch}{.9}\coherencematrix
\end{center}
\caption{\coherence@caption}\label{tab:collaboration}
\end{table}}
\newcommand\coherence@caption{Previous Collaboration between {\pn} members}
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
%% End of file `proposal.cls'.
