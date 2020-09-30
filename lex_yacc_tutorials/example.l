%{
#include <iostream>
#include <string>
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}

%%
[a-zA-Z][a-zA-Z]* {
	printf("found an identifier\n");
	char* captured = strdup(yytext);
	// yylval passes the value of token from lex to yacc
	// yytext gets the actual text of a token
	yylval.cpp_string = new std::string(captured);
	return IDENTIFIER;
}

[\|] {
	return PIPE;
}

[ \t\n]   ;

. {
	ECHO; yyerror ("unexpected character");
}

%%

int yywrap (void) { return 1;}
