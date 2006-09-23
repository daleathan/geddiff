#------------------ libgedcom++ ---------------------------
INCLUDES = -I/usr/local/include -Iinclude
LIB_PATHS = -L/usr/local/lib
FLAGS = -Wall -g $(INCLUDES) $(LIB_PATHS)

#EXE_NAME = bin/geddiff
LIBS=-lgedcom_gom -lutf8tools -lgedcom
OBJ_FILES = obj/address.o obj/association.o obj/changedate.o obj/corporation.o \
			obj/event.o obj/family.o obj/familylink.o obj/gedcomrecord.o obj/header.o \
			obj/headerdata.o obj/individual.o obj/ldsevent.o obj/multimediaitem.o \
			obj/multimedialink.o obj/note.o obj/notesub.o obj/pedigree.o obj/personalname.o \
			obj/place.o obj/repolink.o obj/repository.o obj/source.o obj/sourcecitation.o \
			obj/sourcedata.o obj/sourcedescription.o obj/sourceevent.o obj/submission.o \
			obj/submitter.o obj/text.o obj/userdata.o obj/userrecord.o obj/userrefnumber.o \
			obj/xreflist.o obj/xrefvalue.o

all: lib obj
#bin: $(EXE_NAME)
test : bin/test-libgedcom++
	bin/test-libgedcom++
lib : obj
	 g++ -shared -o lib/libgedcom++.so $(OBJ_FILES)
obj: $(OBJ_FILES)

#----------------------Executables-------------------------
bin/geddiff : lib src/geddiff.cpp include/geddiff-prog.h 
	g++ $(FLAGS) $(LIBS) -o bin/geddiff $(OBJ_FILES)
bin/geddiff-test : test-src/geddiff-test.cpp include/geddiff-prog.h $(OBJ_FILES)
	g++ $(FLAGS) -o bin/geddiff-test test-src/geddiff-test.cpp $(OBJ_FILES)

#--------------------Object files---------------------------
obj/geddiff.o : src/geddiff.cpp
	g++ $(FLAGS) -c src/geddiff.cpp -o obj/geddiff.o
obj/geddiff-prog.o : src/geddiff-prog.cpp include/geddiff-prog.h
	g++ $(FLAGS) -c src/geddiff-prog.cpp -o obj/geddiff-prog.o
obj/address.o : include/address.h src/address.cpp
	g++ $(FLAGS) -c src/address.cpp -o obj/address.o
obj/association.o : include/association.h src/association.cpp
	g++ $(FLAGS) -c src/association.cpp -o obj/association.o
obj/changedate.o : include/changedate.h src/changedate.cpp
	g++ $(FLAGS) -c src/changedate.cpp -o obj/changedate.o
obj/corporation.o : include/corporation.h src/corporation.cpp
	g++ $(FLAGS) -c src/corporation.cpp -o obj/corporation.o
obj/event.o : include/event.h src/event.cpp
	g++ $(FLAGS) -c src/event.cpp -o obj/event.o
obj/family.o : include/family.h src/family.cpp
	g++ $(FLAGS) -c src/family.cpp -o obj/family.o
obj/familylink.o : include/familylink.h src/familylink.cpp
	g++ $(FLAGS) -c src/familylink.cpp -o obj/familylink.o
obj/gedcomrecord.o : include/gedcomrecord.h src/gedcomrecord.cpp
	g++ $(FLAGS) -c src/gedcomrecord.cpp -o obj/gedcomrecord.o
obj/header.o : include/header.h src/header.cpp
	g++ $(FLAGS) -c src/header.cpp -o obj/header.o
obj/headerdata.o : include/headerdata.h src/headerdata.cpp
	g++ $(FLAGS) -c src/headerdata.cpp -o obj/headerdata.o
obj/individual.o : include/individual.h src/individual.cpp
	g++ $(FLAGS) -c src/individual.cpp -o obj/individual.o
obj/ldsevent.o : include/ldsevent.h src/ldsevent.cpp
	g++ $(FLAGS) -c src/ldsevent.cpp -o obj/ldsevent.o
obj/multimediaitem.o : include/multimediaitem.h src/multimediaitem.cpp
	g++ $(FLAGS) -c src/multimediaitem.cpp -o obj/multimediaitem.o
obj/multimedialink.o : include/multimedialink.h src/multimedialink.cpp
	g++ $(FLAGS) -c src/multimedialink.cpp -o obj/multimedialink.o
obj/note.o : include/note.h src/note.cpp
	g++ $(FLAGS) -c src/note.cpp -o obj/note.o
obj/notesub.o : include/notesub.h src/notesub.cpp
	g++ $(FLAGS) -c src/notesub.cpp -o obj/notesub.o
obj/pedigree.o : include/pedigree.h src/pedigree.cpp
	g++ $(FLAGS) -c src/pedigree.cpp -o obj/pedigree.o
obj/personalname.o : include/personalname.h src/personalname.cpp
	g++ $(FLAGS) -c src/personalname.cpp -o obj/personalname.o
obj/place.o : include/place.h src/place.cpp
	g++ $(FLAGS) -c src/place.cpp -o obj/place.o
obj/repolink.o : include/repolink.h src/repolink.cpp
	g++ $(FLAGS) -c src/repolink.cpp -o obj/repolink.o
obj/repository.o : include/repository.h src/repository.cpp
	g++ $(FLAGS) -c src/repository.cpp -o obj/repository.o
obj/source.o : include/source.h src/source.cpp
	g++ $(FLAGS) -c src/source.cpp -o obj/source.o
obj/sourcecitation.o : include/sourcecitation.h src/sourcecitation.cpp
	g++ $(FLAGS) -c src/sourcecitation.cpp -o obj/sourcecitation.o
obj/sourcedata.o : include/sourcedata.h src/sourcedata.cpp
	g++ $(FLAGS) -c src/sourcedata.cpp -o obj/sourcedata.o
obj/sourcedescription.o : include/sourcedescription.h src/sourcedescription.cpp
	g++ $(FLAGS) -c src/sourcedescription.cpp -o obj/sourcedescription.o
obj/sourceevent.o : include/sourceevent.h src/sourceevent.cpp
	g++ $(FLAGS) -c src/sourceevent.cpp -o obj/sourceevent.o
obj/submission.o : include/submission.h src/submission.cpp
	g++ $(FLAGS) -c src/submission.cpp -o obj/submission.o
obj/submitter.o : include/submitter.h src/submitter.cpp
	g++ $(FLAGS) -c src/submitter.cpp -o obj/submitter.o
obj/text.o : include/text.h src/text.cpp
	g++ $(FLAGS) -c src/text.cpp -o obj/text.o
obj/userdata.o : include/userdata.h src/userdata.cpp
	g++ $(FLAGS) -c src/userdata.cpp -o obj/userdata.o
obj/userrecord.o : include/userrecord.h src/userrecord.cpp
	g++ $(FLAGS) -c src/userrecord.cpp -o obj/userrecord.o
obj/userrefnumber.o : include/userrefnumber.h src/userrefnumber.cpp
	g++ $(FLAGS) -c src/userrefnumber.cpp -o obj/userrefnumber.o
obj/xreflist.o : include/xreflist.h src/xreflist.cpp
	g++ $(FLAGS) -c src/xreflist.cpp -o obj/xreflist.o
obj/xrefvalue.o : include/xrefvalue.h src/xrefvalue.cpp
	g++ $(FLAGS) -c src/xrefvalue.cpp -o obj/xrefvalue.o

#-------------------Cleanup-----------------------
clean:
	rm -f bin/*
	rm -f obj/*.o
	rm -f ./*~
	rm -f src/*~

#------------------- libgedcom++ ------------------
libgedcom++ :
	cd libgedcom++; make
dep:
	makedepend $(FLAGS) src/*.cpp

test-valgrind : all
	valgrind --log-file=dbg/chess-test --suppressions=dbg/chess-suppressions.supp --tool=memcheck --leak-check=yes --show-reachable=yes bin/chess-test
valgrind : all
	valgrind --log-file=dbg/chess --suppressions=dbg/chess-suppressions.supp --tool=memcheck --leak-check=yes --show-reachable=yes bin/chess
# DO NOT DELETE

src/geddiff-prog.o: include/geddiff-prog.h
src/geddiff.o: include/geddiff-prog.h
