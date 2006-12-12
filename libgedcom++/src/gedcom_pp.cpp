#include "gedcom_pp.h"

void Gedcom::my_message_handler (Gedcom_msg_type type, char *msg)
{
	cout << msg << endl;
}

Gedcom::Gedcom()
{
	gedcom_init();
	gedcom_set_message_handler(Gedcom::my_message_handler);
	int result = gom_parse_file("dbg/file1.ged");
	first_family = new Family( gom_get_first_family() );
	first_individual = new Individual( gom_get_first_individual() );
	first_mm_item = new MultimediaItem( gom_get_first_multimedia() );
	first_note = new Note( gom_get_first_note() );
	first_repo = new Repository( gom_get_first_repository() );
	first_source = new Source( gom_get_first_source() );
	first_submitter = new Submitter( gom_get_first_submitter() );
	first_user_rec = new UserRecord( gom_get_first_user_rec() );
}

Gedcom::~Gedcom()
{
	delete first_family;
	delete first_individual;
	delete first_mm_item;
	delete first_note;
	delete first_repo;
	delete first_source;
	delete first_submitter;
	delete first_user_rec;
}
