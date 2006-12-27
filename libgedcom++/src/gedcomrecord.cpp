/****************************************************************
	gedcomrecord: 
	Josh Hansen
	Tue Sep 5 2006
*****************************************************************/
#include "gedcomrecord.h"

GedcomRecord::GedcomRecord() : prev(0), next(0)
{
}

GedcomRecord::~GedcomRecord()
{
}

/** Search amongst this object and all subsequent in the linked list. @return 0 if
 * no object with @param id the ID being searched for
 * is found */
GedcomRecord* GedcomRecord::get_record(const string id)
{
	if (record_id == id)
		return this;
	else if (next == 0)
		return 0;
	else
		return next->get_record(id);
}

void GedcomRecord::add_record(GedcomRecord* new_record)
{
	if(next)
		next->add_record(new_record);
}
