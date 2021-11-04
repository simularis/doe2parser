# doe2parser
Parse DOE2 model and draw refrigeration systems diagram

Works like this:

* Read in a clean INP file (clean = as saved by eQUEST, no comments or BDL directives)
* Use simple regexp patterns to break up the commands and keywords
* Write the commands and keywords into a SQLite database.
* Use specialized routine to re-parse complex commands like Schedule and clean up quotes.
* Query the database for a digraph of connected nodes.
* Draw the digraph using Graphviz. Can output to SVG, PDF, etc.

Support tool:

Use existing models to guess at allowable references between model nodes. A keyword
that accepts a reference to another model node may expect a certain type of node,
depending on the component and type. There is a workbook to help with this.

Features

* Schedules: limited
* Keyword expressions: no
* "Real" parser e.g. with flex and bison: no
