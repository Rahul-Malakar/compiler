%{
#include <stdio.h>
#include <string.h>
%}

%%
"int"|"float"|"char"|"double"|"void"|"if"|"else"|"else if"|"main"     { printf("Keyword: %s\n", yytext); }
[(),;{},$,@,!]                       { printf("Symbol: %s\n", yytext); }
"["|"]"                                  { printf("Symbol : %s\n", yytext);}
[+\-*/=<>|&]                               { printf("Operator: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*                   { printf("Identifier: %s\n", yytext); }
.                                        { printf("Unknown: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}