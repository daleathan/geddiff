/****************************************************************
	event: 
	Josh Hansen
	Tue Sep 5 2006
*****************************************************************/
#include "event.h"

#include <iomanip>
#include <iostream>

Event::Event()
{}


Event::~Event()
{
	cout << "~Event" << endl;
}

Event::Event(event* c_style_event)
{
	//TODO event ctor
	cout << "Event" << endl;
}
