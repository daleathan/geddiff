/******************************************************
	repository.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef REPOSITORY_H
#define REPOSITORY_H

class Address;
class NoteSub;
class UserRefNumber;
class ChangeDate;

#include <string>
#include "gedcomrecord.h"
using namespace std;
/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Repository : public GedcomRecord
{
	public:
		Repository();
		~Repository();
		//accessors
	private:
		//string xrefstr;
		string name;
		Address* address;
		string phone;
		NoteSub* note;
		UserRefNumber* ref;
		ChangeDate* change_date;
		Repository* next;
		Repository* prev;
};

#endif
