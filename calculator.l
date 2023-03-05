%{
    /*Definition section */
    #include <stdio.h>
    #include <string.h>
    #include "y.tab.h"  // Here we include token definitions
%}
 
%%
[0-9]+                  return NUMBER;
[-*+]                   return *yytext;
\n                      ;
[ \t]+                  /* ignore whitespace */;
%%

int yywrap(void) {
    return 1;
}
 
// driver code
int main()
{
    /* yyin and yyout as pointer
    of File type */
    extern FILE *yyin, *yyout;
 
    /* yyin points to the file input.txt
    and opens it in read mode*/
    yyin = fopen("calc.in", "r");
 
    /* yyout points to the file output.txt
    and opens it in write mode*/
    yyout = fopen("output.txt", "w");
 
    yylex();
    return 0;
}