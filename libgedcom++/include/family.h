/******************************************************
	family.h
	Josh Hansen <josh@cervantes>, (C) 2006
******************************************************/
#ifndef FAMILY_H
#define FAMILY_H

class Event;
class XRefValue;
class XRefList;
class LdsEvent;
class SourceCitation;
class MultimediaLink;
class NoteSub;
class UserRefNumber;
class ChangeDate;

class Gedcom;

#include <string>

#include <gom.h>

#include "gedcomrecord.h"
using namespace std;
/**
	@author Josh Hansen <josh@cervantes>
*/
class Family : public GedcomRecord
{
	public:
		Family();
		Family(family* c_style_family, const Gedcom& gom);
		~Family();
		//accessors
//		Family* get_family(string id);
	private:
		//string xrefstr;
		Event* event;
		XRefValue* husband;
		XRefValue* wife;
		XRefList* children;
		string nr_of_children;
		XRefList* submitters;
		LdsEvent* spouse_sealing;
		SourceCitation* citation;
		MultimediaLink* mm_link;
		NoteSub* note;
		UserRefNumber* ref;
		//string record_id;
		ChangeDate* change_date;
		//Family* prev;
		//Family* next;
};

#endif
