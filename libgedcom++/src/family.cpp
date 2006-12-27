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

Family::Family() : GedcomRecord(), prev(0), next(0)
{
}

/** Initialize a Family object based on a family* struct in the libgedcom GOM */
Family::Family(family* c_family, const Gedcom& gom) : GedcomRecord(), prev(0), next(0)
{
	/** For each reference, first check
	 * in gom to see if that reference already exists in the object tree;
	 * If so, set the pointer to point to the already existant object
	 * If not, set the pointer to point t a 'new' object
	 * 	Be sure that all newly created objects are registered with the gom
	 * object so we can keep track of it */
	
	cout << "Family" << endl;
	xrefstr = c_family->xrefstr;
	
	if (c_family->event)
		event = new Event(c_family->event);
		
	if (c_family->husband)
		husband = new XRefValue(c_family->husband);
		
	if (c_family->wife)
		wife = new XRefValue(c_family->wife);
		
	if (c_family->children)
		children = new XRefList(c_family->children);
	
	if (c_family->nr_of_children)
		nr_of_children = c_family->nr_of_children;
	
	//  struct xref_list *submitters; 
	if (c_family->submitters)
		submitters = new XRefList(c_family->submitters);
	
//  struct lds_event *lds_spouse_sealing; 
	if (c_family->lds_spouse_sealing)
		spouse_sealing = new LdsEvent(c_family->lds_spouse_sealing);
	
//  struct source_citation *citation; 
	if(c_family->citation)
		citation = new SourceCitation(c_family->citation);
		
//  struct multimedia_link *mm_link; 
	if(c_family->mm_link)
		mm_link = new MultimediaLink(c_family->mm_link);
		
//  struct note_sub *note; 
	if(c_family->note)
		note = new NoteSub(c_family->note);
		
//  struct user_ref_number *ref; 
	if(c_family->ref)
		ref = new UserRefNumber(c_family->ref);
		
//  char *record_id; (?)
	if(c_family->record_id)
		record_id = c_family->record_id;
		
//  struct change_date *change_date; 
	if(c_family->change_date)
		change_date = new ChangeDate(c_family->change_date);
		
//  struct user_data *extra; 
	if(c_family->extra)
		extra = new UserData(c_family->extra);
		
//  struct family *next; 
//  struct family *previous; 
}

Family::~Family()
{
	cout << "~Family()" << endl;
	//we'll let the Gedcom object take care of killing 
	//what this object refers to; otherwise we'll have to do a mark and sweep or something similar
	//we will simply delete the next guy
	delete next; 
}

/** Search amongst this object and all subsequent in the linked list. @return 0 if
 * no object with @param id the ID being searched for
 * is found */
Family* Family::get_family(string id)
{
	if (record_id == id)
		return this;
	else if (next == 0)
		return 0;
	else
		return next->get_family(id);
}
