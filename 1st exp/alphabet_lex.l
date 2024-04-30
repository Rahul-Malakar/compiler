%{
    #include<stdio.h>

%}

%%
[a-zA-Z] {printf("Alphabet : %s\n");}
[0-9]  {printf("Digit : %s\n");}
.       {}
%%

int main(){
    yylex();
    return 0;
}
