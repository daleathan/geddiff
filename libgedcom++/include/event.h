/******************************************************
	event.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef EVENT_H
#define EVENT_H

class DateValue;
class Place;
class Address;
class AgeValue;
class SourceCitation;
class MultimediaLink;
class NoteSub;
class XRefValue;
class UserData;

#include <gom.h>

#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Event
{
	public:
		Event();
		Event(event* c_style_event);
		~Event();
		//accessors
	private:
		//int event; // what is this?
		string event_name;
		string val;
		string type;
		DateValue* date;
		Place* place;
		Address* address;
		string phone;
		AgeValue* age;
		string agency;
		string cause;
		SourceCitation* citation;
		MultimediaLink* mm_link;
		NoteSub* note;
		AgeValue* husband_age;
		AgeValue* wife_age;
		XRefValue* family;
		string adoption_parent;
		UserData* extra;
		Event* next;
		Event* prev;
};

#endif
