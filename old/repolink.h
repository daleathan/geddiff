/******************************************************
	repolink.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef REPOLINK_H
#define REPOLINK_H

class XRefValue;
class NoteSub;
class SourceDescription;

/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class RepoLink
{
	public:
		RepoLink();
		~RepoLink();
		//accessors
	private:
		XRefValue* link;
		NoteSub* note;
		SourceDescription* description;
};

#endif
