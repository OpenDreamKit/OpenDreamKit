# Deliverable description, as taken from Github issue's #95 on 2016-09-07 {.notoc}

- **WP4:** [User Interfaces](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP4)
- **Lead Institution:** Simula Research Laboratory
- **Due:** 2016-08-31 (month 12)
- **Nature:** Other
- **Task:** T4.2 (#70)
- **Proposal**: [p.48](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP4/D4.6/report-final.pdf)**

Version control tools, such as Git and Mercurial, have become an integral part of open and collaborative science and software. Version control tools allow proposed changes to be reviewed ('diffing') and resolve conflicts through combination of changes ('merging'). Jupyter notebook documents are stored in text files as JSON formatted data. This makes them well suited to tracking in version control, but the JSON structure can make diffing and merging difficult.

For this deliverable, we have developed the `nbdime` tool for diffing and merging notebook documents with awareness of the structured nature of the documents, allowing a significantly improved experience over naïve text-file diffing and merging tools. `nbdime` can be integrated into the popular git version control system, maximizing impact on common developer workflows.
