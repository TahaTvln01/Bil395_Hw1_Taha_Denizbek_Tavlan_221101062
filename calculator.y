%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
int result;
%}

%token NUMBER PLUS MINUS TIMES DIVIDE LPAREN RPAREN

%left PLUS MINUS
%left TIMES DIVIDE

%%

input:
    | input expr '\n' { printf("Result: %d\n", $2); result = $2; }
    | input '\n'       { }
    ;

expr: expr PLUS expr   { $$ = $1 + $3; }
    | expr MINUS expr  { $$ = $1 - $3; }
    | expr TIMES expr  { $$ = $1 * $3; }
    | expr DIVIDE expr { 
        if ($3 == 0) {
            yyerror("Division by zero error");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
    }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter an arithmetic expression (Ctrl+C to exit):\n");
    while (yyparse()) {} 
    return 0;
}
