/******************************************************
	multimediaitem.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef MULTIMEDIAITEM_H
#define MULTIMEDIAITEM_H

class NoteSub;
class XRefValue;
class UserRefNumber;
class ChangeDate;

#include <string>
#include <gom.h>
#include "gedcomrecord.h"
using namespace std;
/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class MultimediaItem : public GedcomRecord
{
	public:
		MultimediaItem();
		MultimediaItem(multimedia* c_style_mm_item);
		~MultimediaItem();
		//accessors
	private:
		//string xrefstr;
		string form;
		string title;
		NoteSub* note;
		string data;
		XRefValue* continued;
		UserRefNumber* ref;
		ChangeDate* change_date;
		MultimediaItem* next;
		MultimediaItem* prev;
};

#endif
