/******************************************************
	note.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef NOTE_H
#define NOTE_H

class SourceCitation;
class UserRefNumber;
class ChangeDate;

#include <string>

#include <gom.h>

#include "gedcomrecord.h"
using namespace std;
/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Note : public GedcomRecord
{
	public:
		Note();
		Note(note* c_style_note);
		~Note();
	private:
		//string xrefstr;
		string text;
		SourceCitation* citation;
		UserRefNumber* ref;
		ChangeDate* change_date;
		Note* next;
		Note* prev;
};

#endif
