/******************************************************
	userrefnumber.h
	Josh Hansen <josh@cervantes>, (C) 2006
******************************************************/
#ifndef USERREFNUMBER_H
#define USERREFNUMBER_H

class UserData;

#include <gom.h>

#include <string>
using namespace std;

/**
	@author Josh Hansen <josh@cervantes>
*/
class UserRefNumber
{
	public:
		UserRefNumber();
		UserRefNumber(user_ref_number* c_ref);
		~UserRefNumber();
	private:
		string value;
		string type;
		UserData* extra;
		UserRefNumber* next;
		UserRefNumber* prev;
};

#endif
