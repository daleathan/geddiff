/******************************************************
	sourcedescription.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef SOURCEDESCRIPTION_H
#define SOURCEDESCRIPTION_H

class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class SourceDescription
{
	public:
		SourceDescription();
		~SourceDescription();
		//accessors
	private:
		string call_number;
		string media;
		UserData* extra;
		SourceDescription* next;
		SourceDescription* prev;
};

#endif
