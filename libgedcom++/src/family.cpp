/****************************************************************
	family: 
	Josh Hansen
	Tue Sep 5 2006
*****************************************************************/
#include "family.h"
#include "event.h"

#include <iomanip>
#include <iostream>

Family::Family()
		: GedcomRecord()
{}

Family::Family(family* c_style_family)
{
//struct family { (?)
//  char *xrefstr; 
//  struct event *event; 
//  struct xref_value *husband; 
//  struct xref_value *wife; 
//  struct xref_list *children; 
//  char *nr_of_children; (?)
//  struct xref_list *submitters; 
//  struct lds_event *lds_spouse_sealing; 
//  struct source_citation *citation; 
//  struct multimedia_link *mm_link; 
//  struct note_sub *note; 
//  struct user_ref_number *ref; 
//  char *record_id; (?)
//  struct change_date *change_date; 
//  struct user_data *extra; 
//  struct family *next; 
//  struct family *previous; 
//}; 
	cout << "Family" << endl;
	xrefstr = c_style_family->xrefstr;
	
	if (c_style_family->event)
		event = new Event(c_style_family->event);
}

Family::~Family()
{
	cout << "~Family()" << endl;
	delete event;
}

string Family::get_xrefstr() const { return xrefstr; }
