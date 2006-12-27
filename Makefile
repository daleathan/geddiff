#------------------------- geddiff ------------------------
CC = g++

INCLUDES = -I/usr/local/include -Iinclude -Ilibgedcom++/include
LIB_PATHS = -L/usr/local/lib -Llib
FLAGS = -Wall -g $(INCLUDES) $(LIB_PATHS)

EXE_NAME = bin/geddiff
LIB_GEDCOM_PP = lib/libgedcom++.so
LIBS=-lgedcom_gom -lutf8tools -lgedcom -lgedcom++

LIB_SRC_RAW = address.cpp association.cpp changedate.cpp charset.cpp corporation.cpp \
			datevalue.cpp event.cpp family.cpp familylink.cpp gedcom_pp.cpp gedcomrecord.cpp header.cpp \
			headerdata.cpp individual.cpp ldsevent.cpp multimediaitem.cpp \
			multimedialink.cpp note.cpp notesub.cpp pedigree.cpp personalname.cpp \
			place.cpp repolink.cpp repository.cpp source.cpp sourcecitation.cpp \
			sourcedata.cpp sourcedescription.cpp sourceevent.cpp submission.cpp \
			submitter.cpp text.cpp userdata.cpp userrecord.cpp userrefnumber.cpp \
			xreflist.cpp xrefvalue.cpp
LIB_SRC = libgedcom++/src/address.cpp libgedcom++/src/association.cpp libgedcom++/src/changedate.cpp libgedcom++/src/charset.cpp libgedcom++/src/corporation.cpp \
			libgedcom++/src/datevalue.cpp libgedcom++/src/event.cpp libgedcom++/src/family.cpp libgedcom++/src/familylink.cpp libgedcom++/src/gedcom_pp.cpp libgedcom++/src/gedcomrecord.cpp libgedcom++/src/header.cpp \
			libgedcom++/src/headerdata.cpp libgedcom++/src/individual.cpp libgedcom++/src/ldsevent.cpp libgedcom++/src/multimediaitem.cpp \
			libgedcom++/src/multimedialink.cpp libgedcom++/src/note.cpp libgedcom++/src/notesub.cpp libgedcom++/src/pedigree.cpp libgedcom++/src/personalname.cpp \
			libgedcom++/src/place.cpp libgedcom++/src/repolink.cpp libgedcom++/src/repository.cpp libgedcom++/src/source.cpp libgedcom++/src/sourcecitation.cpp \
			libgedcom++/src/sourcedata.cpp libgedcom++/src/sourcedescription.cpp libgedcom++/src/sourceevent.cpp libgedcom++/src/submission.cpp \
			libgedcom++/src/submitter.cpp libgedcom++/src/text.cpp libgedcom++/src/userdata.cpp libgedcom++/src/userrecord.cpp libgedcom++/src/userrefnumber.cpp \
			libgedcom++/src/xreflist.cpp libgedcom++/src/xrefvalue.cpp
#$(addprefix libgedcom++/src/, $LIB_SRC_RAW)
LIB_OBJ = libgedcom++/obj/address.o libgedcom++/obj/association.o libgedcom++/obj/changedate.o libgedcom++/obj/charset.o libgedcom++/obj/corporation.o \
			libgedcom++/obj/datevalue.o libgedcom++/obj/event.o libgedcom++/obj/family.o libgedcom++/obj/familylink.o libgedcom++/obj/gedcom_pp.o libgedcom++/obj/gedcomrecord.o libgedcom++/obj/header.o \
			libgedcom++/obj/headerdata.o libgedcom++/obj/individual.o libgedcom++/obj/ldsevent.o libgedcom++/obj/multimediaitem.o \
			libgedcom++/obj/multimedialink.o libgedcom++/obj/note.o libgedcom++/obj/notesub.o libgedcom++/obj/pedigree.o libgedcom++/obj/personalname.o \
			libgedcom++/obj/place.o libgedcom++/obj/repolink.o libgedcom++/obj/repository.o libgedcom++/obj/source.o libgedcom++/obj/sourcecitation.o \
			libgedcom++/obj/sourcedata.o libgedcom++/obj/sourcedescription.o libgedcom++/obj/sourceevent.o libgedcom++/obj/submission.o \
			libgedcom++/obj/submitter.o libgedcom++/obj/text.o libgedcom++/obj/userdata.o libgedcom++/obj/userrecord.o libgedcom++/obj/userrefnumber.o \
			libgedcom++/obj/xreflist.o libgedcom++/obj/xrefvalue.o
#$(addprefix libgedcom++/obj/, $(LIB_SRC_RAW:.cpp=.o) )

SRC_RAW = geddiff.cpp geddiff-prog.cpp 
OBJ = obj/geddiff.o obj/geddiff-prog.o #$(addprefix obj/, $(SRC_RAW:.cpp=.o) )
SRC = src/geddiff.cpp src/geddiff-prog.cpp #$(addprefix src/, $(SRC_RAW) )
all : obj lib bin #test-bin 
test-bin : bin/geddiff-test
lib : $(LIB_OBJ)
	g++ -shared -o $(LIB_GEDCOM_PP) $(LIB_OBJ)

obj: $(OBJ) $(LIB_OBJ)

bin: $(EXE_NAME) #tags

depend:
	makedepend -Yinclude $(SRC)

clean:
	rm -f $(OBJ) $(LIB_OBJ) $(EXE_NAME) $(LIB_GEDCOM_PP)
	cd obj; rm -f *.o;

#----------------------Executables-------------------------
#bin/geddiff : lib src/geddiff.cpp include/geddiff-prog.h 
#	g++ $(FLAGS) $(LIBS) -o bin/geddiff $(OBJ_FILES)
$(EXE_NAME): $(OBJ)
	$(CC) -o $@ $(FLAGS) $(LIBS) $(OBJ) #$(LIB_OBJ)
#bin/geddiff-test : test-src/geddiff-test.cpp include/geddiff-prog.h $(OBJ_FILES)
#	g++ $(FLAGS) -o bin/geddiff-test test-src/geddiff-test.cpp $(OBJ_FILES)

#--------------------Object files---------------------------
#obj/geddiff.o : src/geddiff.cpp
#	g++ $(FLAGS) -c src/geddiff.cpp -o obj/geddiff.o
#obj/geddiff-prog.o : src/geddiff-prog.cpp include/geddiff-prog.h
#	g++ $(FLAGS) -c src/geddiff-prog.cpp -o obj/geddiff-prog.o
$(OBJ): obj/%.o: src/%.cpp
	$(CC) -c $(FLAGS) $< -o $@
$(LIB_OBJ): libgedcom++/obj/%.o: libgedcom++/src/%.cpp
	$(CC) -c $(FLAGS) $< -o $@

dep:
	makedepend $(FLAGS) src/*.cpp

test-valgrind : all
	valgrind --log-file=dbg/chess-test --suppressions=dbg/chess-suppressions.supp --tool=memcheck --leak-check=yes --show-reachable=yes bin/chess-test

#--suppressions=dbg/chess-suppressions.supp
valgrind : all
	LD_LIBRARY_PATH=/usr/local/lib/:lib valgrind --log-file=dbg/geddiff --tool=memcheck --leak-check=yes --show-reachable=yes bin/geddiff

run:
	LD_LIBRARY_PATH=/usr/local/lib/:lib ./bin/geddiff
# DO NOT DELETE

src/geddiff-prog.o: include/geddiff-prog.h
src/geddiff.o: /usr/local/include/gedcom.h /usr/include/stdio.h
src/geddiff.o: /usr/include/features.h /usr/include/sys/cdefs.h
src/geddiff.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
src/geddiff.o: /usr/include/gnu/stubs-32.h /usr/include/bits/types.h
src/geddiff.o: /usr/include/bits/typesizes.h /usr/include/libio.h
src/geddiff.o: /usr/include/_G_config.h /usr/include/wchar.h
src/geddiff.o: /usr/include/bits/wchar.h /usr/include/gconv.h
src/geddiff.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
src/geddiff.o: /usr/local/include/gedcom-tags.h /usr/local/include/gom.h
src/geddiff.o: /usr/include/time.h /usr/include/bits/time.h
src/geddiff.o: include/geddiff-prog.h libgedcom++/include/gedcom_pp.h
src/geddiff.o: libgedcom++/include/family.h
src/geddiff.o: libgedcom++/include/gedcomrecord.h
src/geddiff.o: libgedcom++/include/individual.h
src/geddiff.o: libgedcom++/include/multimediaitem.h
src/geddiff.o: libgedcom++/include/note.h libgedcom++/include/repository.h
src/geddiff.o: libgedcom++/include/source.h libgedcom++/include/repolink.h
src/geddiff.o: libgedcom++/include/sourcedata.h
src/geddiff.o: libgedcom++/include/submitter.h
src/geddiff.o: libgedcom++/include/userrecord.h
