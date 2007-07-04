/******************************************************
	changedate.h
	Josh Hansen <josh@cervantes>, (C) 2006
******************************************************/
#ifndef CHANGEDATE_H
#define CHANGEDATE_H

class DateValue;
class NoteSub;
class UserData;

#include <gom.h>

#include <string>
using namespace std;

/**
	@author Josh Hansen <josh@cervantes>
*/
class ChangeDate
{
	public:
		ChangeDate();
		ChangeDate(change_date* c_change_date);
		~ChangeDate();
	private:
		DateValue* date;
		string time;
		NoteSub* note;
		UserData* extra;
};

#endif
