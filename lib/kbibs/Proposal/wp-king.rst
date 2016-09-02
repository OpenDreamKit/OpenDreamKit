Social and Technical Aspects of cross-project development
---------------------------------------------------------

Before joining Sage, I did some development in Singular. The workflow in
Singular at that time was different to that in Sage. Meanwhile Singular also
has a public bug tracker, but still there are differences in how work gets
done. These differences constitute both social and technical impediments to
collaborative development.

Say, a Sage developer has found an issue that
was ultimately caused by a bug in Singular---how should she help to fix it
upstream? It is conceivable that different expectations on the workflow would
be annoying to either the Sage developers or the Singular developers. Some
social research could help to formulate best practices to smoothen
cross-project software development.

Sage provides certain tools to make development easer, e.g., by dev scripts or
`git trac`. However, these are designed for work on the Sage library. It would
foster collaboration if similar tools would be available for other
projects. It would then be possible for a Sage developer to fix a bug in one
component of Sage and use a script to comfortably create a ticket on an
upstream bug tracker, or even push commits to an upstream repository.
