%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]       ; 
\n          { return '\n'; }  
\+          { return PLUS; }
\-          { return MINUS; }
\*          { return TIMES; }
\/          { return DIVIDE; }
\(          { return LPAREN; }
\)          { return RPAREN; }
.           { printf("Unknown character: %s\n", yytext); return 1; }

%%

int yywrap() { return 1; }
