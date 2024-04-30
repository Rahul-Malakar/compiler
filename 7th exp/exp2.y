%{
    #include<stdio.h>
    #include<math.h>
    int flag=0;
    int power(int a, int b){
      int c = 1;
      for(int i=1; i<=b; i++){
         c *= a;
      }
      return c;
    }
   
%}
%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '^' 
%left '(' ')'
%%
ArithmeticExpression: E{
         printf("\nResult=%d\n",$$);
         return 0;
        }
E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {$$=$1/$3;}
 |E'%'E {$$=$1%$3;}
 |E'^'E {$$=power($1,$3);}
 |'('E')' {$$=$2;}
 | NUMBER {$$=$1;}
;
%%

int main()
{
   printf("\nEnter Any Arithmetic Expression :\n");
   yyparse();
  if(flag==0)
   printf("\nEntered arithmetic expression is Valid\n\n");
 
}
void yyerror()
{
   printf("\nEntered arithmetic expression is Invalid\n\n");
   flag=1;
}