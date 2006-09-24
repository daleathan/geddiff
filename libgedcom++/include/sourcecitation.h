/******************************************************
	sourcecitation.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef SOURCECITATION_H
#define SOURCECITATION_H

class XRefValue;
class DateValue;
class Text;
class MultimediaLink;
class NoteSub;
class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class SourceCitation
{
	public:
		SourceCitation();
		~SourceCitation();
		//accessors
	private:
		string description;
		XRefValue* reference;
		string page;
		string event;
		string role;
		DateValue* date;
		Text* text;
		string quality;
		MultimediaLink* mm_link;
		NoteSub* note;
		UserData* extra;
		SourceCitation* next;
		SourceCitation* prev;
};

#endif
