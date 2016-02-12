geddiff is an effort at implementing a diff-like algorithm for comparison of GEDCOM files. The hope is to put an end to the ridiculous manual, one-at-a-time merge process that currently plagues many family history/genealogy efforts.

## GEDCOM Object Model ##
geddiff includes libraries representing the structure of a GEDCOM file, built on top of the low-level GEDCOM callback parser for Ruby developed by Jamis Buck<sub>1</sub>. A copy of Mr. Buck's library is included in our source tree at lib/gedcom-ruby. All of our object model code is available in lib and licensed under LGPL v2.1 or later, as the low-level parser is.

## Diff Algorithm ##
We plan to base our algorithm on that proposed in D. Randall Wilson's "Graph-Based Remerging of Genealogical Databases." This is available in PDF format at docs/Wilson - remerge.pdf. The implementation of the algorithm is in src/graph\_merge.rb and is licensed under GPL v2 or later.

Essential to this algorithm is an ability to compute a confidence score indicating the likelihood that a record in one database is equivalent to a record in another database. We may port some code from the GRAMPS project<sub>2</sub> that already deals with such comparisons, though we also may just implement our own from scratch.

Text comparison code could come from Edit Distance Alignment<sub>3</sub>, amatch<sub>4</sub>, or Text<sub>5</sub>

## Prerequisites ##
Install Diff::LCS (diff-lcs) from Ruby gems<sub>6</sub>

Install gedcom-ruby library<sub>1</sub>

## References ##
|1| - http://gedcom-ruby.sourceforge.net/               LGPL, latest release: 1.0, 27 June 2003

|2| - http://www.gramps-project.org                     GPLv2, latest release: 2.2.8, 22 April 2007

|3| - http://rubyforge.org/projects/editalign/          beta, GPLv1, latest release: 30 May 2006

|4| - http://rubyforge.org/projects/amatch              beta, GPLv2, latest release: v0.2.3, 26 September 2006

|5| - http://rubyforge.org/projects/text                Ruby license, latest release: v1.1.2, 20 February 2007

|6| - http://raa.ruby-lang.org/project/diff-lcs/        GPLv2+, latest release: v1.1.2, 21 October 2004

See also:
  * http://www.alphaworks.ibm.com/tech/xmldiffmerge
  * http://en.wikipedia.org/wiki/Diff
  * http://en.wikipedia.org/wiki/Levenshtein_distance