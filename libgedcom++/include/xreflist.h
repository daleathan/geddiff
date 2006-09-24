/******************************************************
	xreflist.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef XREFLIST_H
#define XREFLIST_H

class XRefValue;
class UserData;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class XRefList
{
	public:
		XRefList();
		~XRefList();
		//accessors
	private:
		XRefValue* xref;
		UserData* extra;
		XRefList* next;
		XRefList* prev;
};

#endif
