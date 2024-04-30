%{
#include <stdio.h>
#include <string.h>
%}


%%
[ \t\n]          ;  // Ignore whitespace anerd newline characts

[a-zA-Z_][a-zA-Z0-9_]*   { printf("Identifier: %s\n", yytext); }
[+*/-=%<>&|^!()]         { printf("Operator: %s\n", yytext); }

.                       ; // Ignore other characters

%%

int main() {
    yylex();
    return 0;
}
