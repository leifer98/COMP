.PHONY: all clean

CC = g++
CFLAGS = -std=c++17

all: clean
	flex scanner.lex
	bison -Wcounterexamples -d parser.y
	$(CC) $(CFLAGS) -o hw5 *.c *.cpp
t0: clean
	flex scanner.lex
	bison -Wcounterexamples -d parser.y
	$(CC) $(CFLAGS) -o hw5 *.c *.cpp
	./hw5 < hw5-tests/t0.in > output.ll
	llc output.ll -o output.s
	clang output.s -o output
	./output > result.txt
	diff -s result.txt hw5-tests/t0.out
clean:
	rm -f lex.yy.* parser.tab.* hw5
