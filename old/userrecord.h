/******************************************************
	userrecord.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef USERRECORD_H
#define USERRECORD_H

class XRefValue;
class UserData;
#include <string>

#include <gom.h>

using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class UserRecord
{
	public:
		UserRecord();
		UserRecord(user_rec* c_style_user_rec);
		~UserRecord();
	private:
		string xrefstr;
		string tag;
		string str_value;
		XRefValue* xref_value;
		UserData* extra;
		UserRecord* next;
		UserRecord* prev;
};

#endif
