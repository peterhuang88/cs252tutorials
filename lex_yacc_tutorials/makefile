calc: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -o example

lex.yy.c: y.tab.c example.l
	lex example.l

y.tab.c: example.y
	yacc -d example.y

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h example.dSYM

