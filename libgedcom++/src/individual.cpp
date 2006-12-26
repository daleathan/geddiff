/****************************************************************
	individual: 
	Josh Hansen
	Tue Sep 5 2006
*****************************************************************/
#include "individual.h"
#include <iomanip>
#include <iostream>

Individual::Individual()
		: GedcomRecord()
{}

Individual::Individual(individual* c_style_individual)
{
	//TODO Individual ctor
	cout << "Individual" << endl;
	//init this individual based on c_style_individual and then see if there's a 'next' 
}

Individual::~Individual()
{
}

