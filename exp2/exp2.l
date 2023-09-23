/*Lex Program to count numbers of lines, words, spaces and characters 

in a given statement*/
%{
#include<stdio.h>
int sc=0,wc=0,lc=0,cc=0;
%}

%%
[\n] { lc++; cc+=yyleng;}
[  \t] { sc++; cc+=yyleng;}
[^\t\n ]+ { wc++;  cc+=yyleng;}
%%

int main()
{
FILE *file;
file=fopen("input.c","r");
if(!file)
{
printf("could not open the file");
exit(0);
}
yyin=file;
yylex();
	printf("The number of lines=%d\n",lc);
	printf("The number of spaces=%d\n",sc);
	printf("The number of words=%d\n",wc);
	printf("The number of characters are=%d\n",cc);
printf("\n");
return(0);
}
int yywrap()
{
return(1);
}
