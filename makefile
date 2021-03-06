EXE = main

CC = g++
COMPILER_FLAGS = -std=c++17 -O2 -Wall -w -pedantic
LINKER_FLAGS = -lncurses
INCLUDEDIR = -I"src/"

CXXFILES = $(shell find src -type f -name '*.cpp')
OBJECTS  = $(CXXFILES:src/%.cpp=obj/%.o)

all: dirs $(EXE) run

run: 
	bin/./$(EXE)

$(EXE): $(OBJECTS)
	$(CC) $(OBJECTS) -g -o bin/$(EXE) $(LINKER_FLAGS) $(INCLUDEDIR) $(COMPILER_FLAGS)

obj/%.o: src/%.cpp
	$(CC) $(COMPILER_FLAGS) $< -g -c -o $@ $(INCLUDEDIR)

dirs:
	mkdir -p bin	
	mkdir -p obj
	mkdir -p data/classes
	mkdir -p data/courses
clean:
	rm -f $(OBJECTS)