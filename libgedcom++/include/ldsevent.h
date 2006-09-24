/******************************************************
	ldsevent.h
	Josh Hansen <josh@cervantes>, (C) 2006
******************************************************/
#ifndef LDSEVENT_H
#define LDSEVENT_H

class DateValue;
class XRefValue;
class SourceCitation;
class NoteSub;
class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <josh@cervantes>
*/
class LdsEvent
{
	public:
		LdsEvent();
		~LdsEvent();
		//accessors
	private:
		int event;	//event_id?
		string event_name;
		string date_status;
		DateValue* date;
		string temple_code;
		string living_ordinance_place;
		XRefValue* family;
		SourceCitation* citation;
		NoteSub* note;
		UserData* extra;
		LdsEvent* next;
		LdsEvent* prev;
};

#endif
