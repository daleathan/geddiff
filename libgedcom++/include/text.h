/******************************************************
	text.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef TEXT_H
#define TEXT_H

class UserData;
#include <string>
using namespace std;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Text
{
	public:
		Text();
		~Text();
	private:
		string text;
		UserData* extra;
		Text* next;
		Text* prev;
};

#endif
