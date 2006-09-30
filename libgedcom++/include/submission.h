/******************************************************
	submission.h
	Josh Hansen <oyevato@gmail.com>, (C) 2006
******************************************************/
#ifndef SUBMISSION_H
#define SUBMISSION_H

class XRefValue;
#include <string>
#include "gedcomrecord.h"
using namespace std;
/**
	@author Josh Hansen <oyevato@gmail.com>
*/
class Submission : public GedcomRecord
{
		public:
		Submission();
		~Submission();
		//accessors
	private:
		//string xrefstr;
		XRefValue* submitter;
		string family_file;
		string temple_code;
		string nr_of_ancestor_gens;
		string nr_of_descendant_gens;
		string ordinance_process_flag;
		//string record_id;

};

#endif
