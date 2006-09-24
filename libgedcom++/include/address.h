/******************************************************
	address.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef ADDRESS_H
#define ADDRESS_H

class UserData;
#include <string>
using namespace std;
/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Address
{
	public:
		Address();
		~Address();
	private:
		string full_label;
		string line1;
		string line2;
		string city;
		string state;
		string postal;
		string country;
		UserData* extra;
};

#endif
