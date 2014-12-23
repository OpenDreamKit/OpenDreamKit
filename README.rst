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

- Objectives: 5-10 lines typically itemized
- Description: as appropriate; typically 10 lines to half a page
  depending on the variety and number of tasks
- Number of tasks: as appropriate; typically 3-5?
- Each task: 5-15 lines, 1-3 deliverables


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

January 10th:
- final version

January 14th:
- submission

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
