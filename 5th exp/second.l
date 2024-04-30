%{
    #include<stdio.h>
    int countArr[256];
%}

%%

[a-zA-Z0-9][a-zA-Z0-9]* {
    for(int i=0; i<yyleng; i++){
        countArr[yytext[i]-'0']++;
    }}
%%

int main(){
    yylex();
    printf("The repeated characters and their count are as follows :\n");
    for(int i=0; i<256; i++){
        if(countArr[i] > 1){
            char ch = (char)('0' + i);
            printf("character = %c\t count = %d\n", ch, countArr[i]);
        }
    }
    return 0;
}