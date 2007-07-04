/******************************************************
	xreflist.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef XREFLIST_H
#define XREFLIST_H

#include <gom.h>

class XRefValue;
class UserData;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class XRefList
{
	public:
		XRefList();
		XRefList(xref_list* c_style_xref_list);
		~XRefList();
		//accessors
	private:
		XRefValue* xref;
		UserData* extra;
		XRefList* next;
		XRefList* prev;
};

#endif
