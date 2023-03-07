%{
#include <stdio.h>
#include <string.h>
#define YYSTYPE char *
#include "y.tab.h"
%}

%%
set                     { return TOKSET; }
read                    { return TOKREAD; }
on|off|[0-9]+           { yylval=strdup(yytext); return STATEVAL; }
[a-zA-Z]+               { yylval=strdup(yytext); return STATEKEY; }
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
%%