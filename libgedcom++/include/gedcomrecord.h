/******************************************************
	gedcomrecord.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef GEDCOMRECORD_H
#define GEDCOMRECORD_H

class UserData;

#include <string>
using namespace std;

/**
 * Superclass of all GEDCOM record classes. Contains any elements common to all types of records
	@author Josh Hansen <oyevato@gmail.com>
**/

class GedcomRecord
{
	public:
		GedcomRecord();
		~GedcomRecord();
		UserData* get_extra() const { return extra; }
		string get_record_id() const { return record_id; }
		string get_xrefstr() const { return xrefstr; }
		GedcomRecord* get_record(const string id);
		void add_record(GedcomRecord* new_record);
	private:
	protected:
		UserData* extra;
		GedcomRecord* prev;
		GedcomRecord* next;
		string record_id;
		string xrefstr;
};

#endif
