%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
#include <iostream>
#include <string>
#include <string.h>
#include <cstdio>
//#define YYSTYPE char*
%}

// %union {int num; char id;}         /* Yacc definitions */
%union
{
	char* string_val;
 	// Example of using a c++ type in yacc
	std::string* cpp_string;
}
%start line
%token <cpp_string> IDENTIFIER
%token PIPE

%%

line:
	identifiers

identifiers:
	IDENTIFIER {
		printf("argument: %s\n", $1->c_str());
	}
	| identifiers PIPE IDENTIFIER {
		printf("argument: %s\n", $3->c_str());
	}
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
