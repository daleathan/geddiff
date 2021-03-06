/******************************************************
	header.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef HEADER_H
#define HEADER_H

class DateValue;
class UserData;
class XRefValue;
#include <string>
#include "source.h"
#include "gedcom_pp.h"	//??
#include "charset.h"	//??

using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/

class Header
{
	public:
		Header();
		~Header();
		//accessors
	private:
		Source source;
		string destination;
		DateValue* date;
		string time;
		XRefValue* submitter;
		XRefValue* submission;
		string filename;
		string copyright;
		Gedcom gedcom;
		Charset charset;
		string language;
		string place_hierarchy;
		string note;
		UserData* extra;
};

#endif
