/******************************************************
	source.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef SOURCE_H
#define SOURCE_H

class MultimediaLink;
class NoteSub;
class UserRefNumber;
class ChangeDate;

#include <string>

#include <gom.h>

#include "repolink.h"
#include "sourcedata.h"
#include "gedcomrecord.h"
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Source : public GedcomRecord
{
	public:
		Source();
		Source(source* c_style_source);
		~Source();
		//accessors
	private:
		//string xrefstr;
		SourceData data;
		string author;
		string title;
		string abbrev;
		string publication;
		string text;
		RepoLink repository;
		MultimediaLink* mm_link;
		NoteSub* note;
		UserRefNumber* ref;
		ChangeDate* change_date;
		Source* next;
		Source* prev;
};

#endif
