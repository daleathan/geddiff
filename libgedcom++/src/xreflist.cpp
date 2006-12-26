/****************************************************************
	xreflist: 
	Josh Hansen
	Tue Sep 5 2006
*****************************************************************/
#include "xreflist.h"

#include <iostream>
#include <iomanip>
using namespace std;

XRefList::XRefList()
{
}

XRefList::XRefList(xref_list* c_style_xref_list)
{
	//TOOD XRefList ctor
	cout << "XRefList" << endl;
}

XRefList::~XRefList()
{
	cout << "~XRefList" << endl;
}

