\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{eudelivreport}[2016/09/29 v1.0 EU Deliverable Report]
\def\@@class{amsart}
\DeclareOption{report}{\def\@@class{amsproc}}
\DeclareOption{book}{\def\@@class{amsbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions

\LoadClass[a4paper,twoside,12pt]{\@@class}
\RequirePackage[utf8]{inputenc}
%\RequirePackage{ae,aecompl,aeguill}	% pour utiliser << et >>
\RequirePackage[english]{babel}
\RequirePackage{times}
\RequirePackage[babel=true,kerning=true]{microtype}
\RequirePackage[left=2.5cm, right=2.5cm, bottom=2.5cm, top=2.5cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{mdframed}
\RequirePackage{paralist}
\RequirePackage{array}
\RequirePackage{listings}
\RequirePackage{pdata}
\RequirePackage{import}
\RequirePackage{hyperref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Styling: adapt amsart's subsection macro to put a newline after the title
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\subsection{\@startsection{subsection}{2}%
  \z@{.5\linespacing\@plus.7\linespacing}{.1\linespacing}%
  {\normalfont\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Macros for defining metadata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\deliverydate}[1]{\def\@deliverydate{#1}}
\newcommand{\duedate}[1]{\def\@duedate{#1}}

% Same as in eu/euproposal.cls and base/proposal.cls, but with an
% hyperlink to the relevant github issues rather than an internal link
% (the proposal file being separate)

\newcommand\site[1]{\@nameuse{wa@institution@#1@acronym}}
\newcommand\sitename[1]{\@nameuse{wa@institution@#1@name}}
\newcommand\delivref[2]{\href{https://github.com/OpenDreamKit/OpenDreamKit/issues/\csname deliv@#1@#2@issue\endcsname}{\csname deliv@#1@#2@label\endcsname}}
\newcommand\longdelivref[2]{\href{https://github.com/OpenDreamKit/OpenDreamKit/issues/\csname deliv@#1@#2@issue\endcsname}{\csname deliv@#1@#2@label\endcsname: ``\csname deliv@#1@#2@title\endcsname''}}
\newcommand\taskref[2]{\href{https://github.com/OpenDreamKit/OpenDreamKit/issues/\csname task@#1@#2@issue\endcsname}{\csname task@#1@#2@label\endcsname}}
\newcommand\longtaskref[2]{\href{https://github.com/OpenDreamKit/OpenDreamKit/issues/\csname task@#1@#2@issue\endcsname}{\csname task@#1@#2@label\endcsname: ``\csname task@#1@#2@title\endcsname''}}
\renewcommand\WPref[1]{\href{https://github.com/OpenDreamKit//OpenDreamKit/tree/master/WP\csname wp@#1@number\endcsname}{\csname wp@#1@label\endcsname}}
\newcommand\longWPref[1]{\href{https://github.com/OpenDreamKit//OpenDreamKit/tree/master/WP\csname wp@#1@number\endcsname}{\csname wp@#1@label\endcsname: ``\csname wp@#1@title\endcsname''}}

\newcommand{\deliverable}[2]{
  \gdef\deliv@label{\csname deliv@#1@#2@label\endcsname}
  \gdef\deliv@title{\csname deliv@#1@#2@title\endcsname}
  \gdef\deliv@lead{\csname deliv@#1@#2@lead\endcsname}
  \gdef\deliv@issue{\csname deliv@#1@#2@issue\endcsname}
  \def\@title{{Report on {\pn} deliverable \deliv@label{}\\[.2cm]%
      \deliv@title
    }}%
  \def\shorttitle{Report on \deliv@label}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer configuration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancyplain}
%\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.001pt}
\addtolength{\footskip}{\baselineskip}

\fancyfoot[L]{\prop@gen@proposalnumber\quad \prop@gen@acronym}
\fancyfoot[C]{}
\fancyfoot[R]{\thepage}

\fancyhead[RE,LO]{\includegraphics[height=2ex]{\prop@gen@image} \prop@gen@instrument }

\providecommand{\tightlist}{%
\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default front page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\oldmaketitle=\maketitle
\renewcommand{\maketitle}{
  \oldmaketitle%\vfill
  %\strut\par
  \noindent
    \begin{minipage}[c]{2.2cm}\includegraphics[width=2.2cm]{\prop@gen@logo}\end{minipage}  
    \begin{minipage}[c]{13cm}
      \setlength{\extrarowheight}{.5ex}
      %\renewcommand{\arraystretch}{1.1}
    \begin{tabular}{|l|l|}\hline
      Due on &  \@duedate\\
      Delivered on &  \@deliverydate\\
      Lead & \sitename{\deliv@lead} (\site{\deliv@lead})\\\hline
      \multicolumn{2}{|p{13cm}|}{\small
      Progress on and finalization of this deliverable has been tracked
      publicly at:\par\noindent \url{https://github.com/OpenDreamKit/OpenDreamKit/issues/\deliv@issue}}\\\hline
    \end{tabular}
  \end{minipage}
  %\bigskip
  \thispagestyle{fancyplain}
}
\newcommand{\githubissuedescription}{%
  \linebreak\phantom{X} % Workaround to get the topline drawn ...
  \IfFileExists{github-issue-description.md}
  {\begin{mdframed}%
      \IfFileExists{github-issue-description.tex}%
      {\input{github-issue-description}}
      {\lstinputlisting[linewidth=14cm,breaklines=true,
        columns=fullflexible,basicstyle=\footnotesize\sf,
        frame=none]
        {github-issue-description.md}}
  \end{mdframed}}
  {}}


%% For some reason compilation fails is this import is done earlier ...
\import{../../Proposal/}{preamble}


\AtEndDocument{
  \vfil
  \begin{mdframed}
    Disclaimer: this report, together with its annexes and the reports
    for the earlier deliverables, is self contained for auditing and
    reviewing purposes. Hyperlinks to external resources are meant as
    a convenience for casual readers wishing to follow our progress;
    such links have been checked for correctness at the time of
    submission of the deliverable, but there is no guarantee implied
    that they will remain valid.
\end{mdframed}}

\endinput
%%% Local Variables:
%%% mode: latex
%%% TeX-master: "report"
%%% End:
