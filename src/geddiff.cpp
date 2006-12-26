/* gedcom-diff - a utility to identify differences between GEDCOM family history files */

#include <iostream>
#include <iomanip>
using namespace std;

#include <gedcom.h>
#include <gom.h>
#include "geddiff-prog.h"

#include "gedcom_pp.h"

void my_message_handler (Gedcom_msg_type type, char *msg)
{
	cout << msg << endl;
}


int main(int argc, char* argv[])
{
	//gedcom_init();
	//gedcom_set_message_handler(my_message_handler);
	//int result = gom_parse_file("dbg/file1.ged");
	//individual* file1_person = gom_get_first_individual();
//	GeddiffProg prog;
//	prog.run(argc, argv);
	Gedcom file;
}
