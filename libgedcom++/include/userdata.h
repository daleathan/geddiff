/******************************************************
	userdata.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef USERDATA_H
#define USERDATA_H

class XRefValue;
#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class UserData
{
	public:
		UserData();
		~UserData();
		//accessors
	private:
			int level;
			string tag;
			string str_value;
			XRefValue* xref_value;
			UserData* next;
			UserData* prev;
};

#endif
