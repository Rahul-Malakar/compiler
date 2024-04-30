%{
/* Definitions */

int num_lines = 1;
int num_words = 0;
int num_special_chars = 0;
int num_letters = 0;
%}

%%

\n      { num_lines++; }
[\t]+        ;
[a-zA-Z]+       { num_words++; num_letters += strlen(yytext); }
[!@#$%^&*\(\)_\{\}\[\];?/|\n]+    { num_special_chars += strlen(yytext); }

%%

int main(int argc, char *argv[]) {
    
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error opening file.\n");
        return 1;
    }
    yyin = file;

    
    yylex();

 
    printf("Number of lines: %d\n", num_lines);
    printf("Number of words: %d\n", num_words);
    printf("Number of special characters: %d\n", num_special_chars);
    printf("Number of letters: %d\n", num_letters);


    fclose(file);

    return 0;
}