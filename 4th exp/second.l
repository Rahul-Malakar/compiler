Lex program to identify the keywords in a c file and convert it into upper case

%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>
%}

%option noyywrap

%{
// Function to convert a string to uppercase
void convertToUpperCase(char *str) {
    while (*str) {
        *str = toupper((unsigned char)*str);
        str++;
    }
}
%}

%%

int|float|double|char|void|for|while|if|else|return|switch|case|break { 
    convertToUpperCase(yytext); 
    printf("Keyword: %s\n", yytext); 
}

[ \t\n]+    ; // Ignore whitespace
.           ; // Ignore other characters

%%

int main() {
    yylex();
    return 0;
}
