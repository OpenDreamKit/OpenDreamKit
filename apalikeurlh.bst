%%% Modification of BibTeX style file /usr/local/texlive/2008/texmf-dist/bibtex/bst/base//apalike.bst
%%% ... by urlbst, version 0.6-1 (marked with "% urlbst")
%%% See <http://purl.org/nxg/dist/urlbst>
%%% Added webpage entry type, and url and lastchecked fields.
%%% Added hyperref support.
%%% Original headers follow...

% BibTeX `apalike' bibliography style (24-Jan-88 version)
% Adapted from the `alpha' style, version 0.99a; for BibTeX version 0.99a.
% Copyright (C) 1988, all rights reserved.
% Copying of this file is allowed, provided that if you make any changes at all
% you name it something other than `apalike.bst'.
% This restriction helps ensure that all copies are identical.
% Differences between this style and `alpha' are generally heralded by a `%'.
% The file btxbst.doc has the documentation for alpha.bst.
%
% This style should be used with the `apalike' LaTeX style (apalike.sty).
% \cite's come out like "(Jones, 1986)" in the text but there are no labels
% in the bibliography, and something like "(1986)" comes out immediately
% after the author.  Author (and editor) names appear as last name, comma,
% initials.  A `year' field is required for every entry, and so is either
% an author (or in some cases, an editor) field or a key field.
%
% Editorial note:
% Many journals require a style like `apalike', but I strongly, strongly,
% strongly recommend that you not use it if you have a choice---use something
% like `plain' instead.  Mary-Claire van Leunen (A Handbook for Scholars,
% Knopf, 1979) argues convincingly that a style like `plain' encourages better
% writing than one like `apalike'.  Furthermore the strongest arguments for
% using an author-date style like `apalike'---that it's "the most practical"
% (The Chicago Manual of Style, University of Chicago Press, thirteenth
% edition, 1982, pages 400--401)---fall flat on their face with the new
% computer-typesetting technology.  For instance page 401 anachronistically
% states "The chief disadvantage of [a style like `plain'] is that additions
% or deletions cannot be made after the manuscript is typed without changing
% numbers in both text references and list."  LaTeX sidesteps the disadvantage.
%
% History:
%   15-sep-86	(SK,OP)	Original version, by Susan King and Oren Patashnik.
%   10-nov-86	(OP)	Truncated the sort.key$ string to the correct length
%			in bib.sort.order to eliminate error message.
%   24-jan-88	(OP)	Updated for BibTeX version 0.99a, from alpha.bst 0.99a;
%			apalike now sorts by author, then year, then title;
%			THIS `apalike' VERSION DOES NOT WORK WITH BIBTEX 0.98i.

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
%    month		not used in apalike
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    eprint % urlbst
    doi % urlbst
    pubmed % urlbst
    url % urlbst
    lastchecked % urlbst
  }
  {}
  { label extra.label sort.label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

STRINGS { urlintro eprinturl eprintprefix doiprefix doiurl pubmedprefix pubmedurl openinlinelink closeinlinelink } % urlbst...
INTEGERS { hrefform inlinelinks makeinlinelink addeprints adddoiresolver addpubmedresolver }
% Following constants may be adjusted by hand, if desired
FUNCTION {init.urlbst.variables}
{
  "Available from: " 'urlintro := % prefix before URL
  "http://arxiv.org/abs/" 'eprinturl := % prefix to make URL from eprint ref
  "arXiv:" 'eprintprefix := % text prefix printed before eprint ref
  "http://dx.doi.org/" 'doiurl := % prefix to make URL from DOI
  "doi:" 'doiprefix :=      % text prefix printed before DOI ref
  "http://www.ncbi.nlm.nih.gov/pubmed/" 'pubmedurl := % prefix to make URL from PUBMED
  "PMID:" 'pubmedprefix :=      % text prefix printed before PUBMED ref
  #0 'addeprints :=         % 0=no eprints; 1=include eprints
  #0 'adddoiresolver :=     % 0=no DOI resolver; 1=include it
  #0 'addpubmedresolver :=     % 0=no PUBMED resolver; 1=include it
  #2 'hrefform :=           % 0=no crossrefs; 1=hypertex xrefs; 2=hyperref refs
  #0 'inlinelinks :=        % 0=URLs explicit; 1=URLs attached to titles
  % the following are internal state variables, not config constants
  #0 'makeinlinelink :=     % state variable managed by setup.inlinelink
  "" 'openinlinelink :=     % ditto
  "" 'closeinlinelink :=    % ditto
}
INTEGERS { 
  bracket.state
  outside.brackets
  open.brackets
  within.brackets
  close.brackets
}
% ...urlbst to here
FUNCTION {init.state.consts}
{ #0 'outside.brackets := % urlbst
  #1 'open.brackets :=
  #2 'within.brackets :=
  #3 'close.brackets :=

  #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

% urlbst
FUNCTION {output.nonnull.original}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
	{ add.period$ write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    { add.period$ " " * write$ }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

% urlbst...
% The following three functions are for handling inlinelink.  They wrap
% a block of text which is potentially output with write$ by multiple
% other functions, so we don't know the content a priori.
% They communicate between each other using the variables makeinlinelink
% (which is true if a link should be made), and closeinlinelink (which holds
% the string which should close any current link.  They can be called
% at any time, but start.inlinelink will be a no-op unless something has
% previously set makeinlinelink true, and the two ...end.inlinelink functions
% will only do their stuff if start.inlinelink has previously set
% closeinlinelink to be non-empty.
FUNCTION {setup.inlinelink}
{ makeinlinelink
    { hrefform #1 = % hypertex
        { "\special {html:<a href=" quote$ * url * quote$ * "> }{" * 'openinlinelink :=
          "\special {html:</a>}" 'closeinlinelink :=
          }
        { hrefform #2 = % hyperref
            { "\href{" url * "}{" * 'openinlinelink :=
              "}" 'closeinlinelink :=
              }
            'skip$
          if$ % hrefform #2 =
        }
      if$ % hrefform #1 =
      #0 'makeinlinelink :=
    }
    'skip$
 if$ % makeinlinelink
}
FUNCTION {add.inlinelink}
{ openinlinelink empty$
    'skip$
    { openinlinelink swap$ * closeinlinelink *
      "" 'openinlinelink :=
      }
  if$
}
FUNCTION {output.nonnull}
{ % Save the thing we've been asked to output
  's :=
  % If the bracket-state is close.brackets, then add a close-bracket to
  % what is currently at the top of the stack, and set bracket.state
  % to outside.brackets
  bracket.state close.brackets =
    { "]" *
      outside.brackets 'bracket.state :=
    }
    'skip$
  if$
  bracket.state outside.brackets =
    { % We're outside all brackets -- this is the normal situation.
      % Write out what's currently at the top of the stack, using the
      % original output.nonnull function.
      s
      add.inlinelink
      output.nonnull.original % invoke the original output.nonnull
    }
    { % Still in brackets.  Add open-bracket or (continuation) comma, add the
      % new text (in s) to the top of the stack, and move to the close-brackets
      % state, ready for next time (unless inbrackets resets it).  If we come
      % into this branch, then output.state is carefully undisturbed.
      bracket.state open.brackets =
        { " [" * }
        { ", " * } % bracket.state will be within.brackets
      if$ 
      s * 
      close.brackets 'bracket.state :=
    }
  if$
}

% Call this function just before adding something which should be presented in 
% brackets.  bracket.state is handled specially within output.nonnull.
FUNCTION {inbrackets}
{ bracket.state close.brackets =
    { within.brackets 'bracket.state := } % reset the state: not open nor closed
    { open.brackets 'bracket.state := }
  if$
}

FUNCTION {format.lastchecked}
{ lastchecked empty$
    { "" }
    { inbrackets "cited " lastchecked * }
  if$
}
% ...urlbst to here

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

%					apalike needs this function because
%					the year has special punctuation;
%					apalike ignores the month
FUNCTION {output.year.check}
{ year empty$
    { "empty year in " cite$ * warning$ }
    { write$
      " (" year * extra.label * ")" *
      mid.sentence 'output.state :=
    }
  if$
}

FUNCTION {output.bibitem.original}
{ newline$
  "\bibitem[" write$
  label write$
  "]{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry.original}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, jj}{, f.}" format.name$ 't :=   % last name first
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { numnames #2 >
		{ "," * }
		'skip$
	      if$
	      t "others" =
		{ " et~al." * }
		{ " and " * t * }
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.key}			% this function is just for apalike
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
	{ ", editors" * }
	{ ", editor" * }
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ *
	  t #2 global.max$ substring$ 't :=
	}
      if$
    }
  while$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { "volume" volume tie.or.space.connect
      series empty$
	'skip$
	{ " of " * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
	{ series field.or.null }
	{ output.state mid.sentence =
	    { "number" }
	    { "Number" }
	  if$
	  number tie.or.space.connect
	  series empty$
	    { "there's a number but no series in " cite$ * warning$ }
	    { " in " * series * }
	  if$
	}
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
	{ edition "l" change.case$ " edition" * }
	{ edition "t" change.case$ " edition" * }
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
	{ "pages" pages n.dashify tie.or.space.connect }
	{ "page" pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  number empty$
    'skip$
    { "(" number * ")" * *
      volume empty$
	{ "there's a number but no volume in " cite$ * warning$ }
	'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
	{ pop$ format.pages }
	{ ":" * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
	{ "chapter" }
	{ type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
	'skip$
	{ ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
	{ "In " booktitle emphasize * }
	{ "In " format.editors * ", " * booktitle emphasize * }
      if$
    }
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ "In"							% this is for apalike
  " \cite{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  "\cite{" * crossref * "}" *				% this is for apalike
}

FUNCTION {format.incoll.inproc.crossref}
{ "In"							% this is for apalike
  " \cite{" * crossref * "}" *
}

FUNCTION {format.date}
{ year empty$
    'skip$
    { %write$
      "(" year * ")" *
    }
  if$
}
% urlbst...
% Functions for making hypertext links.
% In all cases, the stack has (link-text href-url)
%
% make 'null' specials
FUNCTION {make.href.null}
{
  pop$
}
% make hypertex specials
FUNCTION {make.href.hypertex}
{ 
  "\special {html:<a href=" quote$ *
  swap$ * quote$ * "> }" * swap$ *
  "\special {html:</a>}" *
}
% make hyperref specials
FUNCTION {make.href.hyperref}
{ 
  "\href {" swap$ * "} {\path{" * swap$ * "}}" *
}
FUNCTION {make.href}
{ hrefform #2 =
    'make.href.hyperref      % hrefform = 2
    { hrefform #1 =
        'make.href.hypertex  % hrefform = 1
        'make.href.null      % hrefform = 0 (or anything else)
      if$
    }
  if$
}

% If inlinelinks is true, then format.url should be a no-op, since it's
% (a) redundant, and (b) could end up as a link-within-a-link.
FUNCTION {format.url}
{ inlinelinks #1 = url empty$ or
   { "" }
   { hrefform #1 =
       { % special case -- add HyperTeX specials
         urlintro "\url{" url * "}" * url make.href.hypertex * }
       { urlintro "\url{" * url * "}" * }
     if$
   }
  if$
}

FUNCTION {format.eprint}
{ eprint empty$
    { "" }
    { eprintprefix eprint * eprinturl eprint * make.href }
  if$
}

FUNCTION {format.doi}
{ doi empty$
    { "" }
    { doiprefix doi * doiurl doi * make.href }
  if$
}

FUNCTION {format.pubmed}
{ pubmed empty$
    { "" }
    { pubmedprefix pubmed * pubmedurl pubmed * make.href }
  if$
}

% Output a URL.  We can't use the more normal idiom (something like
% `format.url output'), because the `inbrackets' within
% format.lastchecked applies to everything between calls to `output',
% so that `format.url format.lastchecked * output' ends up with both
% the URL and the lastchecked in brackets.
FUNCTION {output.url}
{ url empty$
    'skip$ 
    { new.block 
      format.url output
      format.lastchecked output 
    }
  if$
}

FUNCTION {output.web.refs}
{
  new.block
  output.url
  addeprints eprint empty$ not and
    { format.eprint output.nonnull }
    'skip$
  if$
  adddoiresolver doi empty$ not and
    { format.doi output.nonnull }
    'skip$
  if$
  addpubmedresolver pubmed empty$ not and
    { format.pubmed output.nonnull }
    'skip$
  if$
}

% Wrapper for output.bibitem.original.
% If the URL field is not empty, set makeinlinelink to be true,
% so that an inline link will be started at the next opportunity
FUNCTION {output.bibitem}
{ outside.brackets 'bracket.state :=
  output.bibitem.original
  inlinelinks url empty$ not and
    { #1 'makeinlinelink := }
    { #0 'makeinlinelink := }
  if$
}

% Wrapper for fin.entry.original
FUNCTION {fin.entry}
{ output.web.refs  % urlbst
  makeinlinelink       % ooops, it appears we didn't have a title for inlinelink
    { setup.inlinelink % add some artificial link text here, as a fallback
      "[link]" output.nonnull }
    'skip$
  if$
  bracket.state close.brackets = % urlbst
    { "]" * }
    'skip$
  if$
  fin.entry.original
}

% Webpage entry type.
% Title and url fields required;
% author, note, year, month, and lastchecked fields optional
% See references 
%   ISO 690-2 http://www.nlc-bnc.ca/iso/tc46sc9/standard/690-2e.htm
%   http://www.classroom.net/classroom/CitingNetResources.html
%   http://neal.ctstateu.edu/history/cite.html
%   http://www.cas.usf.edu/english/walker/mla.html
% for citation formats for web pages.
FUNCTION {webpage}
{ output.bibitem
  author empty$
    { editor empty$
        'skip$  % author and editor both optional
        { format.editors output.nonnull }
      if$
    }
    { editor empty$
        { format.authors output.nonnull }
        { "can't use both author and editor fields in " cite$ * warning$ }
      if$
    }
  if$
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$
  format.title "title" output.check
  inbrackets "online" output
  new.block
  year empty$
    'skip$
    { format.date "year" output.check }
  if$
  % We don't need to output the URL details ('lastchecked' and 'url'),
  % because fin.entry does that for us, using output.web.refs.  The only
  % reason we would want to put them here is if we were to decide that
  % they should go in front of the rather miscellaneous information in 'note'.
  new.block
  note output
  fin.entry
}
% ...urlbst to here


FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.title "title" output.check
  new.block
  crossref missing$
    { journal emphasize "journal" output.check
      format.vol.num.pages output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  output.year.check				% special for apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  new.block
  note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.title "title" output.check
  new.block
  howpublished output
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  output.year.check				% special for apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      new.sentence
      publisher "publisher" output.check
      address output
      format.edition output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.pages output
      address output					% for apalike
      new.sentence					% there's no year
      organization output				% here so things
      publisher output					% are simpler
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  format.authors output
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.btitle "title" output.check
  organization address new.block.checkb
  organization output
  address output
  format.edition output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.title "title" output.check
  new.block
  "Master's thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.title output
  new.block
  howpublished output
  new.block
  note output
  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.btitle "title" output.check
  new.block
  "PhD thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  format.editors output
  editor format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address output				% for apalike
  new.sentence					% we always output
  organization output				% a nonempty organization
  publisher output				% here
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  title empty$ 'skip$ 'setup.inlinelink if$ % urlbst
  format.title "title" output.check
  new.block
  note "note" output.check
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

%			There are three apalike cases: one person (Jones),
%			two (Jones and de~Bruijn), and more (Jones et~al.).
%			This function is much like format.crossref.editors.
%
FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
	'skip$
	{ s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
	    { " et~al." * }
	    { " and " * s #2 "{vv~}{ll}" format.name$ * }
	  if$
	}
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	'key					% apalike uses the whole key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    'key				% apalike uses the whole key
	  if$
	}
	{ editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	'key			% apalike uses the whole key, no organization
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.label}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
	'editor.key.label			% apalike ignores organization
	'author.key.label			% for labeling and sorting
      if$
    }
  if$
  ", "							% these three lines are
  *							% for apalike, which
  year field.or.null purify$ #-1 #4 substring$		% uses all four digits
  *
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
	{ "   " * }
	'skip$
      if$						% apalike uses initials
      s nameptr "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't := % <= here
      nameptr numnames = t "others" = and
	{ "et al" * }
	{ t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
	{ "to sort, need author or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
	{ key empty$
	    { "to sort, need author, editor, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.sort}
{ editor empty$
    { key empty$
	{ "to sort, need editor or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

%			apalike uses two sorting passes; the first one sets the
%			labels so that the `a's, `b's, etc. can be computed;
%			the second pass puts the references in "correct" order.
%			The presort function is for the first pass. It computes
%			label, sort.label, and title, and then concatenates.
FUNCTION {presort}
{ calc.label
  label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
	'editor.sort
	'author.sort
      if$
    }
  if$
  #1 entry.max$ substring$	% for
  'sort.label :=		% apalike
  sort.label			% style
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT		% by label, sort.label, title---for final label calculation

STRINGS { last.label next.extra }	% apalike labels are only for the text;

INTEGERS { last.extra.num }		% there are none in the bibliography

FUNCTION {initialize.extra.label.stuff}	% and hence there is no `longest.label'
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  label extra.label * 'label :=
  extra.label 'next.extra :=
}

EXECUTE {initialize.extra.label.stuff}

ITERATE {forward.pass}

REVERSE {reverse.pass}

%				Now that the label is right we sort for real,
%				on sort.label then year then title.  This is
%				for the second sorting pass.
FUNCTION {bib.sort.order}
{ sort.label
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {bib.sort.order}

SORT		% by sort.label, year, title---giving final bibliography order

FUNCTION {begin.bib}
{ preamble$ empty$				% no \etalchar in apalike
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{}" write$ newline$		% no labels in apalike
}

EXECUTE {begin.bib}

EXECUTE {init.urlbst.variables}
EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
