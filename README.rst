What you need to do
===================

As a participant:
-----------------

#.  Create a file CVs/<First>.<Last>.tex, starting from CVs/template.tex

#.  Read the `description <http://ec.europa.eu/research/participants/portal/desktop/en/opportunities/h2020/topics/2144-einfra-9-2015.html>`_ of the call.

#.  Read the whole proposal.pdf file. Fix typos directly. Look for
    WRITE HERE comments with your initials, and implement them.
    Comment on the mailing list for other suggestions.
    math-vre-h2020-grant-europe@services.cnrs.fr

As leader of a workpackage
--------------------------

Edit the file WorkPackages/<WorkPackageName>.tex.

See WorkPackages/template.tex for further instructions.

As leader of a participating institution:
-----------------------------------------

#. Send Nicolas & Eugenia the PIC for your institution:

   http://ec.europa.eu/research/participants/portal/desktop/en/organisations/

#. Create a file Participants/<Institution>.tex, starting from Participants/template.tex

#. Check that the file is included in participants.tex, section Members of the Consortium

#. Double check the file participants.tex

Deadlines
---------

December 15th:
- Description of all participants in the proposal
- Complete drafts for all work packages, including tasks and deliverables
- Rough overall budget
- Complete draft of Excellence and Impact sections

December 19th:
- List of workshops that we plan to organize: topic, location, organizers
- Rough idea of the milestones
- Overall description of the consortium
- Budget for each participant presubmitted online

Over the Christmas break:
- proofreading and wording improvement
- collect feedback from the community

Wednesday 7-th:

- Tentative list of workshops at each site

  We don't actually need a complete list; just to have an approximate
  number of workshops run at each site to prepare the budget
  accordingly.

  When relevant, workshops can be mentioned in tasks (in particular
  for dissemination tasks!), and and workshop reports can be
  deliverables. Such reports, especially for a "training workshop" can
  be quite short (1-2 pages).

Thursday 8-th:
- Finalized budget
  Eugenia will make a call tomorrow morning with details. In short
  this means that the following information needs to be essentially
  set in stone for each site:
  - Involvement (in Person-Months + salary) of each participating person
  - Hiring budget (in Person-Months + salary)
  - Travel budget  (see H2020/Budget.rst for guidelines)
  - Workshop budget
  - Other direct costs

- Mostly final involvement (in Person-Month) of each participating
  institution in each work package.

Once this is done, there "just" remains to finalize the pdf document.

Sunday 11-th:
- I would like to see all the text completely written so that we can
  focus on final proofreading and little formulation improvements.

Tuesday 13-th:
- Presubmission of a completely acceptable version

Wednesday 14th:
- Final submission (last typo fixes, ...)

Collaborative tool
------------------

We use `https://appear.in/vre-math` to chat

Compiling the proposal
======================

Compiling the proposal
----------------------

Go in this H2020/ directory, and run:

    make

You can also just compile by hand as a usual LaTeX file:

    pdflatex proposal.tex


LaTeX syntax
------------

Tasks::

   \begin{task}[id=portability,title=Portability]
     ...
   \end{task}

You can use the \localtaskref{portability} inside the same work package
to reference this task or \taskref{management}{portability} outside
(assuming that the task is in a \begin{workpackage}[id=management]
There are macros \localtasktref and \tasktref that also add the title.

Deliverables::

   \begin{wpdeliv}[due=48,id=final-mgt-rep,dissem=R,nature=PU]
        {Project Final Report}
        The final report will a summary of all things in the project
   \end{wpdeliv}

There is a title (in the {}) and - optionally - a text (a couple of
lines) that further describes the deliverable. The nature of the
deliverable should be specified using one of the following codes::

    R = Report, P = Prototype, D = Demonstrator, O = Other

The dissemination level should be specified using one of the following
codes::

    PU = Public
    PP = Restricted to other programme participants (including the Commission Services).
    RE = Restricted to a group specified by the consortium (including the Commission Services).
    CO = Confidential, only for members of the consortium (including the Commission Services).

Bibliography
------------

If you need to add a bibTeX data base foo.bib, please commit it, and
add a line \addbibresource{foo.bib} near the other ones at the top of
proposal.tex. We are using biblatex.sty because it is more versatile.
