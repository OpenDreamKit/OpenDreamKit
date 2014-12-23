%%
%% This is file `eureporting.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% euproposal.dtx  (with options: `reporting')
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesPackage{eureporting}[2013/01/13 v1.4 EU Project Reporting]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{reporting}}
\ProcessOptions
\LoadClass[report,noRAM]{reporting}
\RequirePackage{longtable}
\RequirePackage{eurosym}
\RequirePackage{wrapfig}
\RequirePackage{eupdata}
\define@key{prop@gen}{reportperiod}{\def\prop@gen@reportperiod{#1}}
\define@key{prop@gen}{key}{\@dmp{key=#1}%
\@ifundefined{prop@gen@keys}{\xdef\prop@gen@keys{#1}}{\xdef\prop@gen@keys{\prop@gen@keys,#1}}}
\define@key{prop@gen}{projpapers}{\def\prop@gen@projpapers{#1}}
\endinput
%%
%% End of file `eureporting.cls'.
