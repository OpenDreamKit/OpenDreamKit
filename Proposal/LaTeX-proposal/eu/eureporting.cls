%%
%% This is file `eureporting.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% euproposal.dtx  (with options: `reporting')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{eureporting}[2016/12/15 v1.5 EU Project Reporting]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{reporting}}
\ProcessOptions
\LoadClass[report]{reporting}
\RequirePackage{longtable}
\RequirePackage{eurosym}
\RequirePackage{wrapfig}
\RequirePackage{eupdata}
\RequirePackage{datetime}
\RequirePackage{chngcntr}
\counterwithin{figure}{subsection}
\counterwithin{table}{subsection}
\setcounter{secnumdepth}{4}
\define@key{prop@gen}{reportperiod}{\def\prop@gen@reportperiod{#1}}
\define@key{prop@gen}{key}{\@dmp{key=#1}%
\@ifundefined{prop@gen@keys}{\xdef\prop@gen@keys{#1}}{\xdef\prop@gen@keys{\prop@gen@keys,#1}}}
\define@key{prop@gen}{projpapers}{\def\prop@gen@projpapers{#1}}
\endinput
%%
%% End of file `eureporting.cls'.
