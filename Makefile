INCLUDES = -I/usr/local/include -Iinclude
LIB_PATHS = -L/usr/local/lib
FLAGS = -Wall -g $(INCLUDES) $(LIB_PATHS)

EXE_NAME = bin/geddiff
LIBS=-lgedcom_gom -lutf8tools -lgedcom
OBJ_FILES = obj/geddiff.o obj/geddiff-prog.o

all: lib obj bin
bin: $(EXE_NAME)
test : bin/geddiff-test
	bin/geddiff-test
lib : 
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

#-------------------Cleanup-----------------------
clean:
	rm -f bin/*
	rm -f obj/*.o
	rm -f ./*~
	rm -f src/*~

dep:
	makedepend $(FLAGS) src/*.cpp

test-valgrind : all
	valgrind --log-file=dbg/chess-test --suppressions=dbg/chess-suppressions.supp --tool=memcheck --leak-check=yes --show-reachable=yes bin/chess-test
valgrind : all
	valgrind --log-file=dbg/chess --suppressions=dbg/chess-suppressions.supp --tool=memcheck --leak-check=yes --show-reachable=yes bin/chess
# DO NOT DELETE

src/geddiff-prog.o: include/geddiff-prog.h
src/geddiff.o: include/geddiff-prog.h
