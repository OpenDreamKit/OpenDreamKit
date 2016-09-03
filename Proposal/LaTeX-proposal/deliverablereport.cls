\ProvidesClass{deliverablereport}

% Specific to ODK
\newcommand{\prop@gen@proposalnumber}{676541}
\newcommand{\prop@gen@acronym}{\href{http://opendreamkit.org}{OpenDreamKit}}
\newcommand{\prop@gen@instrument}{H2020-EINFRA-2015-1}
\newcommand{\prop@gen@logo}{../../media/ODK_elected_logo.png}
\newcommand{\prop@gen@image}{../../media/logos/Flag_of_Europe.png}

\LoadClass[a4paper,twoside,12pt]{amsart}
\RequirePackage{hyperref}
\RequirePackage[utf8]{inputenc}
%\RequirePackage{ae,aecompl,aeguill}	% pour utiliser << et >>
\RequirePackage[english]{babel}
\RequirePackage{times}
\RequirePackage[babel=true,kerning=true]{microtype}
\RequirePackage[left=2.5cm, right=2.5cm, bottom=2.5cm, top=2.5cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{mdframed}
\RequirePackage{array}
\RequirePackage{../../Proposal/LaTeX-proposal/base/pdata}
\input{../../Proposal/final.pdata}
\input{../../Proposal/WApersons}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Macros for defining metadata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\issue}[1]{\def\@issue{#1}}
\newcommand{\deliverydate}[1]{\def\@deliverydate{#1}}
\newcommand{\duedate}[1]{\def\@duedate{#1}}

% Same as in eu/euproposal.cls and base/proposal.cls, but without an
% hyperlink (since it would point to a different document)
% TODO: add hyperlink to github
\newcommand\site[1]{\@nameuse{wa@institution@#1@acronym}}
\newcommand\sitename[1]{\@nameuse{wa@institution@#1@name}}
\newcommand\delivref[2]{\csname deliv@#1#2@label\endcsname}
\newcommand\taskref[2]{\csname task@#1#2@label\endcsname}

\newcommand{\deliverable}[2]{
  \gdef\deliv@label{\csname deliv@#1#2@label\endcsname}
  \gdef\deliv@title{\csname deliv@#1#2@title\endcsname}
  \gdef\deliv@lead{\csname deliv@#1#2@lead\endcsname}
  \def\@title{{Report on \pn deliverable \deliv@label{}\\[.2cm]\deliv@title}}%
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
  \strut\par\noindent
    \begin{minipage}[c]{2.2cm}\includegraphics[width=2.2cm]{\prop@gen@logo}\end{minipage}  
    \begin{minipage}[c]{13cm}
      \setlength{\extrarowheight}{.5ex}
      %\renewcommand{\arraystretch}{1.1}
    \begin{tabular}{|l|l|}\hline
      Due on &  \@duedate\\
      Delivered on &  \@deliverydate\\
      Lead & \sitename{\deliv@lead} (\site{\deliv@lead})\\\hline
      \multicolumn{2}{|p{13cm}|}{
      Progress on and finalization of this deliverable has been tracked
      publicly on: \url{https://github.com/OpenDreamKit/OpenDreamKit/issues/\@issue}}\\\hline
    \end{tabular}
  \end{minipage}
  \bigskip
  \thispagestyle{fancyplain}
}
\newcommand{\githubissuedescription}{%
  \linebreak\phantom{X} % Workaround to get the topline drawn ...
  \begin{mdframed}
    \input{github-issue-description}
  \end{mdframed}}

\endinput
