/******************************************************
	corporation.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef CORPORATION_H
#define CORPORATION_H

#include <string>
#include "address.h"

using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/

class Corporation
{
	public:
		Corporation();
		~Corporation();
		const string& get_name() const;
		const Address& get_address() const;
		const string& get_phone() const;
		void set_name(const string& new_name);
		void set_address(const Address& new_address);
		void set_phone(const string& new_phone);
	private:
		string name;
		Address address;
		string phone;
};

#endif
