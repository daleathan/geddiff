/******************************************************
	personalname.h
	Josh Hansen <josh@cervantes>, (C) 2006
******************************************************/
#ifndef PERSONALNAME_H
#define PERSONALNAME_H

class SourceCitation;
class NoteSub;
class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <josh@cervantes>
*/
class PersonalName
{
	public:
		PersonalName();
		~PersonalName();
		//accessors
	private:
		string name;
		string prefix;
		string given;
		string nickname;
		string surname_prefix;
		string surname;
		string suffix;
		SourceCitation* citation;
		NoteSub* note;
		UserData* extra;
		PersonalName* next;
		PersonalName* prev;
};

#endif
