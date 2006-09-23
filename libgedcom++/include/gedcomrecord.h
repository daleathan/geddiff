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
	private:
	protected:
	UserData* extra;
	string record_id;
	string xrefstr;
};

#endif
