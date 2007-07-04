/******************************************************
	familylink.h
	Josh Hansen <josh@cervantes>, (C) 2006
******************************************************/
#ifndef FAMILYLINK_H
#define FAMILYLINK_H

class XRefValue;
class Pedigree;
class NoteSub;
class UserData;

/**
	@author Josh Hansen <josh@cervantes>
*/
class FamilyLink
{
	public:
		FamilyLink();
		~FamilyLink();
		//accessors
	private:
		XRefValue* family;
		Pedigree* pedigree;
		NoteSub* note;
		UserData* extra;
		FamilyLink* next;
		FamilyLink* prev;
};

#endif
