/******************************************************
	headerdata.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef HEADERDATA_H
#define HEADERDATA_H

#include <string>
#include "datevalue.h"
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class HeaderData
{
	public:
		HeaderData();
		~HeaderData();
		const string& get_name() const;
		const DateValue& get_date() const;
		const string& get_copyright() const;
		void set_name(const string& new_name);
		void set_date(const DateValue& new_date);
		void set_copyright(const string& new_copyright);
	private:
		string name;
		DateValue date;
		string copyright;
};

#endif
