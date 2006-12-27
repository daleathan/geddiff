#include "gedcom_pp.h"
#include <iostream>
#include <iomanip>

void Gedcom::my_message_handler (Gedcom_msg_type type, char *msg)
{
	cout << msg << endl;
}

Gedcom::Gedcom()
{
	cout << "Gedcom::Gedcom()" << endl;
	gedcom_init();
	gedcom_set_message_handler(Gedcom::my_message_handler);
	/*int result = */ gom_parse_file("dbg/file1.ged");
	first_family = new Family( gom_get_first_family(), *this );
	//first_individual = new Individual( gom_get_first_individual() );
	//first_mm_item = new MultimediaItem( gom_get_first_multimedia() );
	//first_note = new Note( gom_get_first_note() );
	//first_repo = new Repository( gom_get_first_repository() );
	//first_source = new Source( gom_get_first_source() );
	//first_submitter = new Submitter( gom_get_first_submitter() );
	//first_user_rec = new UserRecord( gom_get_first_user_rec() );
	
	cout << first_family->get_xrefstr() << endl;
}

Gedcom::~Gedcom()
{
	//This assumes that each record object is correctly pointing to 
	delete first_family;
	delete first_individual;
	delete first_mm_item;
	delete first_note;
	delete first_repo;
	delete first_source;
	delete first_submitter;
	delete first_user_rec;
}

/** search accessors - @return 0 if the id is not found */
Family* Gedcom::get_family(string id) const
{
	cout << "Getting " << id << endl;
	
}

Individual* Gedcom::get_individual(string id) const
{
}

MultimediaItem* Gedcom::get_mm_item(string id) const
{
}

Note* Gedcom::get_note(string id) const
{
}

Repository* Gedcom::get_repo(string id) const
{
}

Source* Gedcom::get_source(string id) const
{
}

Submitter* Gedcom::get_submitter(string id) const
{
}

UserRecord* Gedcom::get_user_rec(string id) const
{
}

//This is a generic one - useful?
GedcomRecord* Gedcom::get_record(string id) const
{
}
