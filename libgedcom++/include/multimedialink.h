/******************************************************
	multimedialink.h
	Josh Hansen <josh@cervantes>, (C) 2006
******************************************************/
#ifndef MULTIMEDIALINK_H
#define MULTIMEDIALINK_H

class XRefValue;
class NoteSub;
class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <josh@cervantes>
*/
class MultimediaLink
{
	public:
		MultimediaLink();
		~MultimediaLink();
	private:
		XRefValue* reference;
		string form;
		string title;
		string file;
		NoteSub* note;
		UserData* extra;
		MultimediaLink* next;
		MultimediaLink* prev;
};

#endif
