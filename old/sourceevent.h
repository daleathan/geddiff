/******************************************************
	sourceevent.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef SOURCEEVENT_H
#define SOURCEEVENT_H

class DateValue;
class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class SourceEvent
{
	public:
		SourceEvent();
		~SourceEvent();
	private:
		string recorded_events;
		DateValue* date_period;
		string jurisdiction;
		UserData* extra;
		SourceEvent* next;
		SourceEvent* prev;
};

#endif
