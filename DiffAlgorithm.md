# Wilson: "Graph-Based Remerging of Genealogical Databases" #
The algorithm we will probably implement was described by D. Randall Wilson in [Graph-Based Remerging of Genealogical Databases](http://www.fht.byu.edu/prev_workshops/workshop01/final/Wilson.pdf). The rest of this section is quoted verbatim from Wilson, though it still needs some cleaning up to match the wiki formatting requirements.

## Graph-based Merging Algorithm ##
A new algorithm is presented here for aiding in the merging process by taking into account the relationships of individuals in the database. The algorithm does not require the storage of unique ID numbers (though ID numbers can add an extra level of confidence if they are available), nor does it require anyone to “check out” (lock) portions of the database. Users are free to make independent updates and then upon receiving a copy of another version of the database, they can view the differences fairly quickly and decide which pieces of information, individuals, or new branches of individuals they wish to import into their database, and resolve any conflicts that have arisen.

Outline of Algorithm. Suppose two people begin with a copy of the same database. Both modify their databases, resulting in two databases that have much information in common. Then one person wants to merge the second one (the incoming database) into the first one (the user’s own database) in order to create a “complete” database with all of the information from both of them.

The algorithm begins by identifying groups of individuals that appear in both databases that can be assumed (with very high probability) to be matches, and then presents any additions or conflicts to the user so they can incorporate the new information into their database. The algorithm proceeds as follows.
  1. Sort both databases using the same criteria (name, birth date, etc.—even unique ID numbers if available).
> 2. Find matching individuals.
> > a) Start at the top of both sorted lists.


> b) As long as either person is “less than” the other, skip the “lower” one. Also, skip anyone that is already part of a “subgraph.”
> c) When a match is found:
> > i. Mark both people as part of the same “subgraph”.
> > ii. Recursively find relatives of these people (parents, spouses, children) that also match, marking each of them as part of the same subgraph.
> > iii. Keep a list of differences encountered at the “edges” of the subgraph to come back to.
> > iv. Continue until all relationship links have ended in differences.

> d) Continue Steps (b) and (c) until the bottom of both lists are reached.
> 3. Choose the largest subgraph (i.e., the one with the most individuals in it) and make sure it is large enough to ensure that the matches are true (e.g., at least 20 people or 20% of the database).
> 4. Present the user with the differences at the edges of this subgraph.
> > a) For additional individuals (i.e., those in the incoming database but not in the user’s own database), the user can decide whether to add them (and/or whether they are the same person as someone else in the same family). The user may also choose to add any other additional individuals that connect through this one in order to add whole subgraphs at once.
> > b) For individuals with additional information (e.g., a death date, ordinance information, or additional notes), the user can decide whether to include the information.
> > c) For individuals with conflicting information (e.g., a different birth place), the user can decide which information to use in their version of the individual, and whether to mention the difference in a note. The user could also decide that the individuals with conflicting information are in fact different people, in which case the extra person can be added or excluded.
> > d) When the incoming database has missing individuals or otherwise matching individuals that are missing fields of information, the user need not be bothered, since the idea is to add to their database rather than delete from it. However, the user may choose to be shown individuals with missing information in order to confirm that the match is valid. Furthermore, the user may choose to be shown missing individuals with an option to delete them, if they suspect that the incoming database may have removed some individuals that should really not have been in there.

> 5. Once an individual is added or modified to bring the two databases into agreement and have the user’s confirmation that they reference the same person, the individuals are considered “matches” (even if they still have some differences). If the individual was on the boundary between two subgraphs, then the two subgraphs may be combined (i.e., people in the other one are marked as being part of this one, and the list of “edge differences” are added together). In this way, the database can often eventually become one large graph that includes everyone. Steps 3-5 are repeated on the largest remaining subgraph until all individuals in the incoming database are accounted for.
> This algorithm avoids adding anything to the main database without the approval of the user, but also saves the user from having to deal with the vast majority of the records which are clearly identical. It is common to have several people in the same database with the same name, and possible that their other information will match, too (especially if they do not have much information specified). However, it is extremely unlikely that they will both have the same relationship to dozens of people whose information also matches unless they are really the same person. The key to this algorithm is the use of relationships between similar people to increase the confidence of matches.
> Many users prefer to examine any new information being added to their precious database, but others may trust the incoming database enough to prefer more automation. They may prefer to have all new people and/or all new fields of information added to their database without having to examine each one, and then deal personally only with the few cases where there are conflicting pieces of information (e.g., different birth dates for an otherwise identical individual).

# Other Algorithm Candidates #
Perhaps our algorithm could utilize the Harmony project?

See also:
  * http://www.alphaworks.ibm.com/tech/xmldiffmerge
  * http://revctrl.org/CategoryMergeAlgorithm