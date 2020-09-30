%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}

%%
[a-zA-Z] {
	printf("found an identifier\n");
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
