/******************************************************
	submitter.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef SUBMITTER_H
#define SUBMITTER_H

class Address;
class MultimediaLink;
class ChangeDate;
class Submitter;
#include "gedcomrecord.h"
#include <string>

using namespace std;


/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Submitter : public GedcomRecord
{
	public:
		Submitter();
		~Submitter();
	private:
		//string xrefstr
		string name;
		Address* address;
		string phone;
		MultimediaLink* mm_link;
		string language; //??
		string record_file_nr;
		//string record_id;
		ChangeDate* change_date;
		//UserData* extra;
		Submitter* next;
		Submitter* prev;
};

#endif
