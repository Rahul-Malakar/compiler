%{
int commentCount = 0;
%}



%%

"//"(.)* {commentCount++}
"/*"(.)*"*/" {commentCount++}

%%

int main() {
    yylex();
    printf("\nNumber of comments: %d\n", commentCount);
    return 0;
}
