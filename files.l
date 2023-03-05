/*Lex program to take input from file 
and write output in a separate file*/
 
%{
    /*Definition section */
    #include <stdio.h>
%}
 
%%
[a-zA-Z][a-zA-Z0-9]*    fprintf(yyout, "WORD ");
[a-zA-Z0-9\/.-]+        fprintf(yyout, "FILENAME ");
\"                      fprintf(yyout, "QUOTE ");
\{                      fprintf(yyout, "OBRACE ");
\}                      fprintf(yyout, "EBRACE ");
;                       fprintf(yyout, "SEMICOLON ");
\n                      fprintf(yyout, "\n");
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
    yyin = fopen("input.conf", "r");
 
    /* yyout points to the file output.txt
    and opens it in write mode*/
    yyout = fopen("output.txt", "w");
 
    yylex();
    return 0;
}