%{
#include<stdio.h>
int valid=1;
%}
%token A B
%%
str:S'\n' {return 0;}
S:A S B
 |
 ;
%%

int yyerror()
{
    printf("\nIts not a string!\n");
    valid=0;
    return 0;
}

int main()
{
   printf("Enter the string:\n");
   yyparse();
   if(valid){
    printf("\nValid string\n");
   }
   
}