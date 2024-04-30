%{
#include <stdio.h>
%}

%%

"https://"([^"\n\t\r\f\v]+)   { printf("URL: %s\n", yytext); }
"http://"([^"\n\t\r\f\v]+)    { printf("URL: %s\n", yytext); }
"www."([^"\n\t\r\f\v]+)       { printf("URL: %s\n", yytext); }
.|\n                          ;

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error: Unable to open file %s\n", argv[1]);
        return 1;
    }

    yyin = file;
    yylex();

    fclose(file);
    return 0;
}

int yywrap() {
    return 1;
}