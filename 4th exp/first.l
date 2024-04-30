%{
#include <stdio.h>

int keyword_count = 0;
int operator_count = 0;
int identifier_count = 0;
int comment_count = 0;
%}

%%
"int"|"float"|"double"|"char"|"void"|"if"|"else"|"for"|"while"|"do"|"return"|"break"|"continue"|"switch"|"case"|"default" {
    keyword_count++;
    printf("%s", yytext);
}

"="|"+"|"-"|"*"|"/"|"%"|"++"|"--"|"=="|"!="|"<"|">"|"<="|">="|"&&"|"||"|"!" {
    operator_count++;
    printf("%s", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    identifier_count++;
    printf("%s", yytext);
}

"/*" {
    comment_count++;
    while (1) {
        char ch = input();
        if (ch == EOF) {
            fprintf(stderr, "Unterminated comment\n");
            break;
        }
        if (ch == '*' && input() == '/') {
            comment_count--;
            break;
        }
    }
}

"//".* {
    comment_count++;
}

. {
    // Ignore other characters
    printf("%c", yytext[0]);
}

%%

int main() {
    yylex();
    
    printf("\nKeywords: %d\n", keyword_count);
    printf("Operators: %d\n", operator_count);
    printf("Identifiers: %d\n", identifier_count);
    printf("Comments: %d\n", comment_count);
    
    return 0;
}