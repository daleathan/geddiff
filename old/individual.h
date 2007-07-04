/******************************************************
	individual.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef INDIVIDUAL_H
#define INDIVIDUAL_H

class PersonalName;
class Event;
class LdsEvent;
class FamilyLink;
class XRefList;
class Association;
class SourceCitation;
class MultimediaLink;
class NoteSub;
class UserRefNumber;
class ChangeDate;

#include <string>
//---gedcom_parse----
#include <gom.h>
//------libgedcom++-----
#include "gedcomrecord.h"


using namespace std;
/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Individual : public GedcomRecord
{
	public:
		Individual();
		Individual(individual* c_style_individual);
		~Individual();
		//accessors
	private:
	
		//string xrefstr;
		string restriction_notice;
		PersonalName* name;
		string sex;
		Event* event;
		Event* attribute;
		LdsEvent* individual_ordinance;
		FamilyLink* child_to_family;
		FamilyLink* spouse_to_family;
		XRefList* submitters;
		Association* association;
		XRefList* alias;
		XRefList* ancestor_interest;
		XRefList* descendant_interest;
		SourceCitation* citation;
		MultimediaLink* mm_link;
		NoteSub* note;
		string record_file_nr;
		string ancestral_file_nr;
		UserRefNumber* ref;
		ChangeDate* change_date;
		Individual* next;
		Individual* prev;
};

#endif
