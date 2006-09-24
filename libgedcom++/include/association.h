/******************************************************
	association.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef ASSOCIATION_H
#define ASSOCIATION_H

class XRefValue;
class SourceCitation;
class NoteSub;
class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Association
{
	public:
		Association();
		~Association();
		//accessors
	private:
		XRefValue* to;
		string type;
		string relation;
		SourceCitation* citation;
		NoteSub* note;
		UserData* extra;
		Association* next;
		Association* prev;
};

#endif
