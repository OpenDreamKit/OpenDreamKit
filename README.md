Main repository for the OpenDreamKit H2020 European project
===========================================================

- Website: [OpenDreamKit.org](http://www.OpenDreamKit.org)
- Proposal files: [Proposal/](Proposal/), we also use the proposal as a basis the developing grant agreements, etc. and for the macros.
- Proposal evaluation: [ProposalEvaluation/](ProposalEvaluation/)
- E-Concertation with other H2020 E-infrastructure projects: [EConcertation/](EConcertation/)
- [![Join the chat at https://gitter.im/OpenDreamKit/discuss](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/OpenDreamKit/discuss?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
- deliverables and publications of the respective Work Packages: [WP1/](WP1/), [WP2/](WP2/) , [WP3/](WP3/) , [WP4/](WP4/) , [WP5/](WP5/) , [WP6/](WP6/) , [WP6/](WP6/)
- management scripts: [bin/](bin/)
- media files: [media/](media/)
- Legal documents: [LegalDocuments/](LegalDocuments/)
- bibliographies, etc: [lib/](lib/)

# Instructions for participants

## General recommendations

- Use existing infrastructure whenever possible (e.g. Sage's trac
  server), and in particular when contributing to existing software.

- Use ODK's github organisation for most public ODK specific
  infrastructure.

## Advertise ODK's activities

Add a post in the [news](http://opendreamkit.org/news/) or [activities](http://opendreamkit.org/activities/) pages of the website or an entry in the [events](http://opendreamkit.org//) section.

Typically a talk at a conference goes in the activities section while an ODK workshop (or related workshop) goes in the events section.

## Acknowledge ODK's support

See our [Acknowledgement web page](http://opendreamkit.org/acknowledge/)

## Finance  best practice

The Commission attracts our attention to the most common errors identified in cost claims:

- Costs claimed that are not substantiated or are not linked to the project
- Third parties and sub-contracting
- Depreciation
- Indirect cost models
- Indirect costs - Ineligible costs included in the pool of indirect costs
- Personnel costs - Calculation of productive hours
- Personnel costs - Charging of hours worked on the project
- Personnel costs - Use of average personnel costs
- Payment of salaries to owner/managers of SMEs
- VAT (VAT IS INELIGIBLE!)

For the full version delivered by the Commission, click [here](avoid-finance-errors_en.pdf)

## OpenAccess process

The Université Paris-Sud published an information sheet on openaccess best practices. You can find the information, in French, [here](Horizon2020_et_OpenAccess_french.pdf).

However an internal process has been set up (cf Data management Plan)

Partners will be following the process explained below. The lead partner of the publication takes responsibility for the openaccess process for peer-reviewed publications.

#### Publication in the journal of their choice:

Partners must be keeping in mind the Commission asks not to accept more than 6 month embargo (to check the publishers’ policies use http://www.sherpa.ac.uk/romeo/)

#### Give openaccess to all peer-reviewed publications, with a max. of 6 months embargo.

- Partners upload publications on http://arxiv.org/, or on another openaccess platform of their choice

- Warn the Coordinator so that they keep list of publication of OpenDreamKit publications updated on the project website


#### Data related to open access publications

The lead partner of a publication will send to the Project Manager all the data related to the peer-reviewed publication once it is given full openaccess. Data related to a publication are all the data needed to reexamine the research leading to the publication.
The Project Manager will publish the data linked to publications on http://zenodo.org/. Thanks to the publications’ DOIs, the data will be linked to publications.

#### Openaire

Once publications are published on an openaccess platform and their data published on Zenodo, the OpenAire website will be linkage between them. All OpenDreamKit published work will be present on this webpage:
https://www.openaire.eu/search/project?projectId=corda__h2020::1930bdaa9032dd5b34f25841ebf3e8d1

In order for publications and data to appear on this website, one must state when completing forms on the openaccess paltform (such as ArXiv) and Zenodo websites that the concerned work is being financed by Horizon 2020 project number 676541.

## Project discussions

- The few private discussions (that involve for example nominative
  information) should occur on the relevant private mailing list
  (steering committee, coordination team, ...; see our
  [contact web page](http://opendreamkit.org/follow/)).

  Please make sure any private information is encrypted, especially
  given that some of us use gmail.

- Fine grained public discussions should go on github issues, with
  notices to the appropriate teams and persons.

- When an important such discussion is started, a notice shall be sent
  to participants@opendreamkit.org.

Design goals:

- As much as possible of the discussions is public, centralized,
  easily searchable, linkable, etc.

- People can keep a broad eye view on action happening in other work
  packages, without being flooded by e-mail / notices.

## Sharing and collaborating on documents

You can use this repository (or that of the web page when relevant) to
collaborate on public documents. There is a subdirectory for each work
package.

Private documents can be shared using the private repositories of the
relevant body:

- https://github.com/OpenDreamKit/Steering
- https://github.com/OpenDreamKit/Site-leaders  # Do we need this one?
- https://github.com/OpenDreamKit/Coordinator
- https://github.com/OpenDreamKit/Coordination
- https://github.com/OpenDreamKit/Advisory
- https://github.com/OpenDreamKit/Participants

## Progress tracking

Each ODK task and deliverable is modelled by a public github
issue. They are accessible from the sidebar of our web
page. Furthermore each deliverable is attached to a milestone for
tracking its deadline (Month xxx of the project).

The purpose of those issues is:

- To keep track of our progress, both for ourselves, but also for
  outsiders and for our *EU reviewers*.

- To host discussions

A first draft of each issue was created automatically using the
metadata produced in Proposal/final.pdata. It should be further edited
and maintained. The issue should be assigned to whoever will be
leading it, in addition to the work package leader.

By convention, we use the first comment on the issue as a description
of that issue (github is missing an explicit notion of issue
description). It should contain and be continuously updated with:

- a description of the task (taken from the proposal) or deliverable
- a brief status overview
- crosslinks to the corresponding tasks/deliverables
- todo list, sketch of plan, references to relevant resources on the
  web, @mentions of people that could/should be involved.

  Whenever possible, this includes creating issues/tickets on the
  tracking systems of the relevant systems.

For examples, see #50, #87, #72.

Alternatively, when natural, the issue can be a brief pointer to an
issue of the relevant software where the actual discussion happens.
In this case, only ODK specific info (link to task, delivery date,
status report, ...) needs to be on the issue.

## Submitting a deliverable

### Steps for the deliverable lead

- Edit the github issue description (i.e. its first comment) to give
  an overview (think abstract of a paper) of the deliverable. This
  information will be included at the beginning of the report.

    - What was the original goal.
    - How it fits within the overall ODK picture.
    - Where the work started from.

    - What precisely is the deliverable, and was achieved during the
      project, clarifying the contribution of the ODK participants and
      of the community.

    - A brief view on applications, further outcomes, current
      activities, future plans.

    The distinction between what was done before, for, and after the
    deliverable should be strictly unambiguous.

    This description should be self-contained. Still, it's recommended
    to enrich it with cross links as appropriate.  In particular add
    links for all issues on the different component trackers (trac,
    ...)  that have been worked on to achieve the deliverable.  The
    link label/context should be explanatory: the reader should not
    need to follow the link to know what additional information it
    provides.

    If this gets too long (say more than one page), the details can be
    left to the report itself.

- Double check the deliverable metadata is up to date:
    - Leader (as specified by the person the issue is assigned to),
      participants, and sites involved.
    - Due and delivery date, milestone.
    - Estimate of the number of PM's that were put to achieve the deliverable.
    - Link to the relevant ODK task(s) and reciprocally.
    - (when times come): link to the report and presentation slides.

- A report should be written, in LaTeX, and in `WPX/DX.Z/report.tex`, using our
  [style file](Proposal/LaTeX-proposal/deliverablereport.cls). You can initialize
  the report file and copy the relevant style files with:

      make WPX/DX.Z/report.pdf

  Rerunning this command later will update the style files if needed and recompile
  the report.

  See the existing reports for further examples.

  The github issue description is semi-automatically included in the
  report. To fetch it from github, run the following command from
  ODK's main repository (no worry if this step fails for you; the
  coordinator will anyway run it before submitting the deliverable):

      DIR=WPX/DX.Z
      rm $DIR/report.pdf $DIR/github-issue-description*; make $DIR/github-issue-description.tex $DIR/report.pdf

  You can then commit the updated github issue description and pdf with:

      cp $DIR/report.pdf $DIR/report-final.pdf; git add -f $DIR/github-issue-description* $DIR/report-final.pdf; git commit -m "`basename $DIR`: updated github issue description and report pdf" $DIR/github-issue-description* $DIR/report-final.pdf; cp $DIR/report-final.pdf /tmp


  The report shall be self-contained. Indeed, the
  deliverable will be evaluated based upon its version submitted on
  the EU portal without retrieving other resources. Links have no
  legal value, since there is no guarantee that the referenced
  material will remain unchanged. One may typically want to add
  relevant material as appendix (e.g. snapshots of software
  documentation, websites, or other relevant documents); see e.g.
  [WP5/D5.1/report.tex](WP5/D5.1/report.tex) or
  [WP2/D2.1/report.tex](WP2/D2.1/report.tex).

  The use of pictures and other visual material is strongly
  recommended.

- Defining authorship is tricky, as most deliverable involve close
  collaboration with the community, and the report is often written by
  a subset of the contributors. Let's use the following simple rule of
  thumb: the authors of the report should include all persons funded
  by ODK that contributed non trivially. Not including outsiders in
  the author list is reasonable, as the report is about the
  contribution of ODK.

- Request early feedback, review, and final proofreading of the report
  - by the work package leader
  - by the coordinator (coordinator@opendreamkit.org)
  - by whoever else you may think is relevant

  Plan ahead, as this will take a couple days!

- Write a blog post in [ODK's news](http://opendreamkit.org/news/)

- Send a notice to participants@opendreamkit.org


### Steps for the coordinator

- Go to the root dir of the main OpenDreamKit repository

- Edit the Makefile to add the deliverable

  Run make to automatically download the github description and build
  the report

- Proofread the pdf

- Commit it as report-final.pdf

- Add a link to the report in the github description

- Submit the PDF on the [EU portal](http://ec.europa.eu/research/participants/portal/):

    - login
    - go to My Projects, Manage Project, Continuous Reporting Data, Deliverables.

    - Uploading a pdf used to fail for me with firefox (Nicolas). A
      workaround was to wrap the pdf in a zip file.

- Close the issue on github

## Organizing a workshop

- Create an issue to discuss the organization of the workshop (choosing the date, ...)
- Propose potential dates with potential participants using Framadate/Doodle or any likewise tool -> Send a first mail to participants@opendreamkit.org / community@opendreamkit.org announcing the plan to organize the workshop.
- Decide the date as early as possible (at least 2 months before workshop) -> send a second mail when date is fixed
- Build the agenda thanks to the related github issue (Coordination Team and the organiser create the agenda for a steering committee meeting)
- Send the agenda and an invitation to the event to all participants
- Announce the workshop on ODK's blog; see e.g. https://opendreamkit.org/2018/06/20/Hamburg-DisseminationWorkshop-SteeringMeeting/
- Use the repository [https://github.com/OpenDreamKit/OpenDreamKit.github.io/tree/master/meetings](https://github.com/OpenDreamKit/OpenDreamKit.github.io/tree/master/meetings) to host the web page and public documents about each meeting
- Run regular oral status reports
- Prepare a written report
- Set up a survey at the end of each workshop to know how the next ones can be improved
- Refer the workshop on the website (http://opendreamkit.org/follow/  -> reports) and create a link to your workshop minutes

For ODK, but also for all of those that are watching with hope over
our shoulders, it's important to write useful reports on our work
during the workshops. To be productive, we should write those reports
collaboratively and on the fly.

Suggested approach: initialize the report with the list of projects,
and put it on a collaborative pad (e.g. hackmd). Then, during each
status report, display the report on the screen, and ask everybody to
take lives notes both on the plan and what's done, directly in a
synthetic project-by-project form. The goal is to have a couple
paragraphs per projects, with links to the end results. And an overall
debriefing.

## Organization of official meetings

- The agenda must be

  - Day 1: test (mock presentation). This should be the exact same setup
    as on the day of the meeting (day 3). But without the EU reviewers.

  - Day 2: project meetings

  - Day 3: official review with
     - 1/2 hour to 1 hour: general presentation
     - presentation of each work package (10 minutes each)
     - deliverable presentation

- (Project Manager) Send official e-mail invitations 20 days in advance to all
  the meeting participants, with the agenda. Those e-mails are to be kept for
  later audits (proving that the attendance was necessary).

- (Project Manager) Prepare a signature sheet to collect attendance (to be kept
  for later audits).

- (Project Manager) In the appropriate git repository, prepare for each site, a
  template file for the progress report, and request all partners to fill in
  the file in advance.

- (Project Manager) Make sure that all the support material (e.g. slides of
  progress reports, ...) is available in advance (e.g. posted online), linked
  from the agenda, and read by all participants before the meeting. This way
  it is sufficient to scan quickly through them during the test, stopping only
  if some point raises a discussion.

- (Project Manager) Set up a pad (e.g. on framapad) or/and a chat room (e.g.
  gitter or use the one in framapad) for collaborative editing of the minutes
  during the meeting. Initialize the pad with the agenda, and links to all
  supporting material. After the meeting, move the content of the pad into a file
  in the relevant git repository for later editing.  Whenever appropriate, make
  this file accessible online.

- Remote participation: For meetings of 4-5 people, RPC-based video conferences
  as above can possibly do the job. For a larger number of people, this does
  not seem to scale. Here are some recommendations:

  - Request all participants to have a wired access (not wifi).

  - Plan for a backup solution so that participants can join by plain
    phone.

  - [Renater's Rendez Vous](https://rendez-vous.renater.fr/) might
    be a good option as it is supposed to provide a bridge with phone
    lines. However, at this point (February 2016), only the latest
    development version of firefox is supported.

  - Explore webcast solutions as an alternative to peer-to-peer video
    conference, so that at least remote participants can follow what's
    going on.

## Recommendations of Collaborative software

- Chat: [http://gitter.im](http://gitter.im)
- Video conferences: [http://appear.in](http://appear.in), [http://hubl.in](http://hubl.in), or [https://rendez-vous.renater.fr/](https://rendez-vous.renater.fr/)
- Temporary collaborative text editing: [framapad.org](framapad.org)
- Polls: [http://framadate.org](http://framadate.org)
- Anonymous votes: [http://adoodle.org](http://adoodle.org)
- Surveys: [http://limesurvey.org](http://limesurvey.org)
- Whiteboard?
