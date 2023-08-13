CC = gcc
CFLAGS = -Wall -I include/
LIB = -l ncurses
RM = rm -rfv
MV = mv -v
TARG = rcg
BIN = /usr/local/bin/$(TARG)
OBJ = main.o array.o creation.o cases.o

all: $(TARG)

$(TARG): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LIB)

main.o: src/main.c
	$(CC) $(CFLAGS) -c $<

array.o: src/array.c
	$(CC) $(CFLAGS) -c $<

creation.o: src/creation.c
	$(CC) $(CFLAGS) -c $<

cases.o: src/cases.c
	$(CC) $(CFLAGS) -c $<

install: $(TARG)
	$(MV) $(TARG) $(BIN)
	chmod +x $(BIN)

run: $(TARG)
	$(BIN)

clean:
	$(RM) $(OBJ)

uninstall: clean
	$(RM) $(BIN)
