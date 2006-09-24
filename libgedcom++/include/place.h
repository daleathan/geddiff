/******************************************************
	place.h
	Josh Hansen <josh@cervantes>, (C) 2006
******************************************************/
#ifndef PLACE_H
#define PLACE_H

class SourceCitation;
class NoteSub;
class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <josh@cervantes>
*/
class Place
{
	public:
		Place();
		~Place();
		//accessors
	private:
		string value;
		string place_hierarchy;
		SourceCitation* citation;
		NoteSub* note;
		UserData* extra;
};

#endif
