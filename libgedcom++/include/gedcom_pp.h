#ifndef GEDCOM_H_
#define GEDCOM_H_
//#include <gedcom.h>
#include <gom.h>

#include <iostream>
#include <iomanip>
using namespace std;

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
