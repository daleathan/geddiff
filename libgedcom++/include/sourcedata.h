/******************************************************
	sourcedata.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef SOURCEDATA_H
#define SOURCEDATA_H

class SourceEvent;
class NoteSub;

#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class SourceData
{
	public:
		SourceData();
		~SourceData();
		//accessors etc.
	private:
		SourceEvent* event;
		string agency;
		NoteSub* note;
};

#endif
