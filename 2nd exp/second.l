%{
    #include <stdio.h>
%}
%{
int vowels = 0;
int consonants = 0;
%}

%%
[aAeEiIoOuU] { vowels = vowels +1; }
[a-zA-Z] { consonants++; }

\n { printf("Number of vowels: %d\n", vowels);
     printf("Number of consonants: %d\n", consonants);
     exit(0); }
%%

int main() {
    yylex();
    return 0;
}