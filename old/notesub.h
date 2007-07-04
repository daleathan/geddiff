/******************************************************
	notesub.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef NOTESUB_H
#define NOTESUB_H

class XRefValue;
class SourceCitation;
class UserData;

#include <gom.h>

#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class NoteSub
{
	public:
		NoteSub();
		NoteSub(note_sub* c_note);
		~NoteSub();
	private:
		string text;
		XRefValue* reference;
		SourceCitation* citation;
		UserData* extra;
		NoteSub* next;
		NoteSub* prev;
};

#endif
