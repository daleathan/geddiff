/****************************************************************
	family: 
	Josh Hansen
	Tue Sep 5 2006
*****************************************************************/
#include "family.h"

#include "changedate.h"
#include "event.h"
#include "ldsevent.h"
#include "multimedialink.h"
#include "notesub.h"
#include "sourcecitation.h"
#include "userdata.h"
#include "userrefnumber.h"
#include "xrefvalue.h"
#include "xreflist.h"

#include <iomanip>
#include <iostream>

Family::Family()
		: GedcomRecord()
{}

/** Initialize a Family object based on a family* struct in the GOM */
Family::Family(family* c_style_family)
{
	cout << "Family" << endl;
	xrefstr = c_style_family->xrefstr;
	
	if (c_style_family->event)
		event = new Event(c_style_family->event);
		
	if (c_style_family->husband)
		husband = new XRefValue(c_style_family->husband);
		
	if (c_style_family->wife)
		wife = new XRefValue(c_style_family->wife);
		
	if (c_style_family->children)
		children = new XRefList(c_style_family->children);
	
	if (c_style_family->nr_of_children)
		nr_of_children = c_style_family->nr_of_children;
	
	//  struct xref_list *submitters; 
	if (c_style_family->submitters)
		submitters = new XRefList(c_style_family->submitters);
	
//  struct lds_event *lds_spouse_sealing; 
	if (c_style_family->lds_spouse_sealing)
		spouse_sealing = new LdsEvent(c_style_family->lds_spouse_sealing);
	
//  struct source_citation *citation; 
	if(c_style_family->citation)
		citation = new SourceCitation(c_style_family->citation);
		
//  struct multimedia_link *mm_link; 
	if(c_style_family->mm_link)
		mm_link = new MultimediaLink(c_style_family->mm_link);
		
//  struct note_sub *note; 
	if(c_style_family->note)
		note = new NoteSub(c_style_family->note);
		
//  struct user_ref_number *ref; 
	if(c_style_family->ref)
		ref = new UserRefNumber(c_style_family->ref);
		
//  char *record_id; (?)
	if(c_style_family->record_id)
		record_id = c_style_family->record_id;
		
//  struct change_date *change_date; 
	if(c_style_family->change_date)
		change_date = new ChangeDate(c_style_family->change_date);
		
//  struct user_data *extra; 
	if(c_style_family->extra)
		extra = new UserData(c_style_family->extra);
		
//  struct family *next; 
//  struct family *previous; 
}

Family::~Family()
{
	cout << "~Family()" << endl;
	delete event;
	delete husband;
	delete children;
}
