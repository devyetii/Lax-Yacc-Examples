%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}
%%
set                     { return TOKSET; }
read                    { return TOKREAD; }
on|off                  { yylval=strdup(yytext); return BOOL; }
[a-zA-Z]+               { yylval=strdup(yytext); return STATEKEY; }
[0-9]+                  { yylval=strdup(yytext); return NUMBER; }
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
%%