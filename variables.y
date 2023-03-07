%{
    #include <stdio.h>
    #include <string.h>
    #define YYSTYPE char *
    int yylex(void);
    void yyerror(const char *str);
    int state = 0;
    int temp = 0;
    yydebug=1;
%}
%token TOKREAD TOKSET STATEKEY STATEVAL

%%
commands:
        | commands command
        ;
command:
        read_command
        |
        set_command
        ;
read_command:
        TOKREAD STATEKEY
        {
            if (!strcmp($2, "temp")) {
                printf("reading temp = %d\n", temp);
            } else if (!strcmp($2, "state")) {
                printf("reading state = %d\n", state);
            } else {
                printf("invalid read command: %s\n", $2);
            }
        }
        ;
set_command:
        TOKSET STATEKEY STATEVAL
        {
            if (!strcmp($2, "temp")) {
                temp = atoi($3);
                printf("temp set to %d\n", temp);
            } else if (!strcmp($2, "state")) {
                state = !strcmp($3, "on");
                printf("State set to %d\n", state);
            } else {
                printf("invalid set command: %s\n", $2);
            }
        }
        ;
%%

void yyerror(const char *str)
{
    fprintf(stderr,"error: %s\n",str);
}
 
int yywrap()
{
    return 1;
} 
  
main()
{
    yyparse();
}