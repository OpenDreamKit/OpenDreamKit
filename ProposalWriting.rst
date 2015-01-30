Ranting on open proposal writing
================================

Here is some debriefing about the writing of this proposal, mostly as
a memo for myself for future occasions.

 .. contents::

Stand by your dreams
====================

Write a proposal that you and all participants believe is right.

- Go open. Then you won't have a choice than being proud of what you
  write.

- Use a bottom up approach.

  Start by analyzing the needs of the community. Choose the call
  accordingly. And then, and only then, think about a great selling
  story that will make the call and the needs match naturally
  together.

- Encourage the participants to base all their decisions upon what
  they believe in.

Engage the community
====================

The main point of writing this proposal in the open was to get
feedback from the community. This allowed for example to rework early
on some phrasing that could have been misinterpreted.

Yet we did not get as much feedback as I was hoping for. This is
because a proposal is a massive amount of information.  So it's hard
for an outsider to make one's way through it. In particular since
quite some of the information is not directly relevant to the
community, and the overall structure will remain messy for a long
time. Here are some tips that might help next time.

- Build a shared vision

  Write early on -- and keep updating -- a short introduction page on
  the web site with tentative answers to the following questions:

  - Who are we?
  - What is our goal
  - What is our strategy?
  - From where do we start?
  - How do we connect or differ from other projects?
  - Why are we excellent?

- Add links to the main tasks.

- Whenever relevant, write a draft of those tasks as independent
  tickets (typically, for us, on trac.sagemath.org). People will then
  stumble naturally on those that are of interest to them, and
  react. Encourage them to take an active role to shape the tasks in
  the most useful way for the community.

Engage your team
================

Easier to say than to do :-)

In short: run forward and trust your team mates: they have talent.

This `blog post
<http://inverseprobability.com/2015/01/14/open-collaborative-grant-writing/>`_
gave me an interesting perspective from the participant side. The key
thing is that it's both hard and intimidating to get involved.

For the technical side, see the next section.

Finding a nice acronym
======================

There are many acronym generators online that can be quite helpful in
the process. But at the end of the day it's all about creativity; get
everyone involved!

Collaborative tools
===================

Using the right tools is critical for productive collaborative
proposal writing. In case you have a doubt, watch the `video
<https://www.youtube.com/watch?v=kM9zcfRtOqo>`_ of the activity on our
repository.

Some participants won't be familiar with the tools, and may push
toward basic solutions like dropbox+word. This is *NOT* an option when
20 people hack simultaneously on the same files. Stay firm, train
them, and work hard to keep the technical barrier low.

(for this particular proposal, having some technical barrier was
actually not such a bad thing: I wanted to select tech savvy people
anyway).

Use a good version control system (e.g. git)
--------------------------------------------

A decentralized version control system (like git or mercurial) has a
key advantage of offering massive backups.

Having a web interface to the repository is nice for people to easily
browse the information and do small edits.

github did the job to host our repository. It was ok since we had only
public information (no private info on the cloud, please!).  There are
of course alternatives (e.g. gitlab based).

Use a public repository
-----------------------

Be liberal in giving write access. People tend to be shy by default
anyway; and if accidently someone would go to far it's always possible
to revert.

Use a good document writing infrastructure (e.g. LaTeX)
-------------------------------------------------------

The proposal document contains a *lot* of redundant information
(e.g. gantt chart, lists of tasks/deliverables/..., involvement
measures, budget, ...).  It is *vital*, especially for the final rush,
to have some appropriate infrastructure that builds automatically all
of those from duplication free and well located semantic information.

LaTeX and the `proposal
<http://www.ctan.org/tex-archive/macros/latex/contrib/proposal>`_
style file is a good technical option.

Choose such an infrastructure, make the compilation procedure
completely automatic, get an expert on board to help, and push it to
its limits.

We went quite far in this direction. Next time I would want to go even
further and also build the external budget files automatically from
the semantic information in the proposal (not yet implemented).

There is one difficulty here: building the budget files requires to
store some information that is private, like the salary of the
participants. A good approach would be to have a secondary private git
repository with read-write access granted only to, e.g., site leaders
and staff. The infrastructure shall allow to build the proposal itself
with or without the private info.

Document building and version control
-------------------------------------

Usual tip: don't put automatically produced files (e.g. pdf's) under
version control to avoid conflicts.

Exception: if you use like us the web repository browser as web site
for the proposal, you may want to commit from time to time the
proposal's pdf to make it accessible to everybody. That's alright, but
do it under a specific name, so that people don't conflict with it
when they build the pdf locally. See e.g. the =final= dependency
in our `Makefile`_.

Communication
=============

Meetings
--------

The meeting we had in September was fundamental to discuss the needs
and shape the proposal. A bit earlier in the process (e.g. 6 months
before) would have been good. A bit longer (3 days instead of 2) could
have helped too. At the end of the meeting, there should be:

- A first draft of answers to the questions above

- Some idea of what the selling story will be (how do we fit the call?)

- A tentative list of aims and objectives

- A tentative list of work packages, with designated leaders for each
  of them

- A tentative list of sites, with leaders for each of them

Having a second meeting one or two months before the submission would
have been helpful to launch the final rush, brainstorm on the texts.
We mitigated this with online chats.

Online video chats
------------------

Online video chats were extremely useful, especially for brainstorming
with 2-3 people on sensitive pieces of text (intro to the proposal,
work package descriptions, ...), for getting to know each other, and
for fast distribution of tasks at the end. Use them early on and
regularly.

We used intensively `appear.in`_ for this. It can't get simpler: just
share a URL (we used `http://appear.in/vre-math`_) with your
collaborators and you are up and running. It worked for us with
chrome, safari, firefox. It's peer to peer, so in term of privacy it
should be alright.

A limitation: if one of the person had a low bandwidth, this seemed to
affect everybody in the chat room; turning of the video usually
helped.

When brainstorming on chunks of text we wanted to see the evolving
text simultaneously. Git was not enough for this. So we used temporary
google documents. Not very satisfying. I am still looking for a good
peer-to-peer collaborative plain text editor.

Mailing list
------------

We used a private mailing list. I believe that this helped people
speak openly on more sensitive matters. But that's debatable.  Still
we were liberal in including interested external people to get
feedback.

Most of the communication went on this mailing list; roughly 1200
e-mails; with 400 of them in the last two days; crazy ...

The good thing was that everybody could see what was going on. That's
good in particular at the beginning, when there is little action and
it's important to attract attention and to show off that the project
is alive. Having an archive is important too so that anyone can dig
for information. You can't get this with private discussions.

However this went *really* overboard at the end: for all the
participants that were partially involved, sorting through all the
information to find the one that was relevant to them was hard. Many
of them spent as much time reading through the e-mails as really
acting. This is totally unproductive.

I don't have a good solution. I was trying to make it clear at the top
of each e-mail who was directly involved (dear XXX); however this was
clearly not sufficient. A step could be to setup some official keyword
conventions for the subject line, to let people sort them efficiently.
Something like:

    H2020: WP leaders: ...
    H2020: WP HPC: ...
    H2020: Site leaders: ...
    H2020: All participants: ...

Or maybe use something else than e-mail.

TODO list
---------

It must be trivial for each participant to find out what (s)he could
do for the project at any given point. The ``\TOWRITE{XXX}{...}``
lines in the latex sources are natural spots to write this
information.

However extracting and synthesizing this information is necessary to
really engage people (they won't ``git pull`` the latest version and
run ``grep`` by themselves unless they are already seriously engaged).

Sending the synthesis list by e-mail did not work that well. Instead
it should be posted on the web. We were using initials (and keywords
for tasks that could be handled by several persons in a group). First
names probably would have worked better. In any cases, the list of
names / keywords should be standardized.
