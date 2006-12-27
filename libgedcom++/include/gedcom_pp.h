#ifndef GEDCOM_H_
#define GEDCOM_H_
//#include <gedcom.h>
#include <gom.h>

#include <iostream>
#include <iomanip>
using namespace std;

//#include "gedcomrecord.h"

#include "family.h"
#include "individual.h"
#include "multimediaitem.h"
#include "note.h"
#include "repository.h"
#include "source.h"
#include "submitter.h"
#include "userrecord.h"

class Gedcom
{
	public:
		Gedcom();
		virtual ~Gedcom();
		
		/** search accessors - @return 0 if the id is not found */
		Family* get_family(string id) const;
		Individual* get_individual(string id) const;
		MultimediaItem* get_mm_item(string id) const;
		Note* get_note(string id) const;
		Repository* get_repo(string id) const;
		Source* get_source(string id) const;
		Submitter* get_submitter(string id) const;
		UserRecord* get_user_rec(string id) const;
		//This is a generic one - useful?
		GedcomRecord* get_record(string id) const;
		
		Family* get_first_family() const { return first_family; }
		Individual* get_first_individual() const { return first_individual; }
		MultimediaItem* get_first_mm_item() const { return first_mm_item; }
		Note* get_first_note() const { return first_note; }
		Repository* get_first_repo() const { return first_repo; }
		Source* get_first_source() const { return first_source; }
		Submitter* get_first_submitter() const { return first_submitter; }
		UserRecord* get_first_user_rec() const { return first_user_rec; }
	private:
		static void my_message_handler (Gedcom_msg_type type, char *msg);
		Family* first_family;
		Individual* first_individual;
		MultimediaItem* first_mm_item;
		Note* first_note;
		Repository* first_repo;
		Source* first_source;
		Submitter* first_submitter;
		UserRecord* first_user_rec;
		
};

#endif /*GEDCOM_H_*/
