%{
    /*Definition section */
    #include <stdio.h>
    #include <string.h>
    #include "y.tab.h"  // Here we include token definitions
%}
 
%%
[0-9]+                  yylval=atoi(yytext); return NUMBER;
[-+]                    return yytext[0];
\n                      return 0;
[ \t]+                  /* ignore whitespace */;
%%
