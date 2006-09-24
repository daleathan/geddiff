/******************************************************
	pedigree.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef PEDIGREE_H
#define PEDIGREE_H

class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Pedigree
{
	public:
		Pedigree();
		~Pedigree();
		//accessors
	private:
		string pedigree;
		UserData* extra;
		Pedigree* next;
		Pedigree* prev;
};

#endif
