#------------------------- geddiff ------------------------
CC = g++

INCLUDES = -I/usr/local/include -Iinclude -Ilibgedcom++/include
LIB_PATHS = -L/usr/local/lib
FLAGS = -Wall -g $(INCLUDES) $(LIB_PATHS)

EXE_NAME = bin/geddiff
LIB_GEDCOM_PP = lib/libgedcom++.so
LIBS=-lgedcom_gom -lutf8tools -lgedcom

LIB_SRC_RAW = address.cpp association.cpp changedate.cpp charset.cpp corporation.cpp \
			datevalue.cpp event.cpp family.cpp familylink.cpp gedcom_pp.cpp gedcomrecord.cpp header.cpp \
			headerdata.cpp individual.cpp ldsevent.cpp multimediaitem.cpp \
			multimedialink.cpp note.cpp notesub.cpp pedigree.cpp personalname.cpp \
			place.cpp repolink.cpp repository.cpp source.cpp sourcecitation.cpp \
			sourcedata.cpp sourcedescription.cpp sourceevent.cpp submission.cpp \
			submitter.cpp text.cpp userdata.cpp userrecord.cpp userrefnumber.cpp \
			xreflist.cpp xrefvalue.cpp
LIB_SRC = $(addprefix libgedcom++/src/, $LIB_SRC_RAW)
LIB_OBJ = $(addprefix libgedcom++/obj/, $(LIB_SRC_RAW:.cpp=.o) )

SRC_RAW = geddiff.cpp geddiff-prog.cpp 
OBJ = $(addprefix obj/, $(SRC_RAW:.cpp=.o) )
SRC = $(addprefix src/, $(SRC_RAW) )
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
	$(CC) -o $@ $(FLAGS) $(LIBS) $(OBJ) $(LIB_OBJ)
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
valgrind : all
	valgrind --log-file=dbg/chess --suppressions=dbg/chess-suppressions.supp --tool=memcheck --leak-check=yes --show-reachable=yes bin/chess
run:
	LD_LIBRARY_PATH=/usr/local/lib/ ./bin/geddiff
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
