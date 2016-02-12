Welcome to the geddiff wiki! **geddiff** is a diff utility for GEDCOM genealogy files. It is conceptually similar to the standard Unix diff utility, but specialized for use on GEDCOM genealogical data files.

The ultimate purpose of geddiff is to be utilized by other family history software, such as GRAMPS (see http://www.gramps-project.org) or even a revision control system.

# Why are you writing this program? #
As far as I have been able to determine, there exists no readily available software that allows the easy merging of GEDCOM files. This proves to be a major obstacle to family history research. Creating a program to compare GEDCOM files would be a significant step towards achieving that objective.

# What have you done so far? #
So far I've focused on developing a wrapper library called [LibgedcomPlusPlus](LibgedcomPlusPlus.md) to allow me to develop using C++ rather than C. I don't know that this serves any purpose other than to cater to my language preferences and to help familiarize me with the object model.

# What do you plan to accomplish? #
Develop, licensed under the LGPL:
  * libgedcom++ wrapper library
  * libgeddiff containing the core comparison algorithm
  * geddiff utility to provide a command line version of the libgeddiff functionality

Please see our [Roadmap](Roadmap.md)