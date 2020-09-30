%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
%}

%union {int num; char id;}         /* Yacc definitions */
%start line
%token IDENTIFIER
%token PIPE

%%

line:
	identifiers

identifiers:
	IDENTIFIER
	| identifiers PIPE IDENTIFIER
	;

%%

void yyerror(char* s) {
	fprintf(stderr, "%s", s);	
}

int main (void) {
	/* init symbol table */
	//int i;
	//for(i=0; i<52; i++) {
	//	symbols[i] = 0;
	//}

	return yyparse ( );
}
