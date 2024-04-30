%{
int commentCount = 0;
%}

%option noyywrap

%%

"/*"    { commentCount++; int c;
          while ((c = input()) != '*' || (c = input()) != '/')
            ;
        }
"//"    { commentCount++; int c;
          while ((c = input()) != '\n')
            ;
        }

%%

int main() {
    yylex();
    printf("\nNumber of comments: %d\n", commentCount);
    return 0;
}
