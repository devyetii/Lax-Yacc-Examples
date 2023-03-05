%{
    #include <stdio.h>
    #include <string.h>
    #define YYSTYPE char *
    int yylex(void);
    void yyerror(const char *str);
    int state = 0;
    int temp = 0;
    int yydebug=0;
%}
%token TOKREAD TOKSET NUMBER BOOL STATEKEY

%%
commands: /* empty */
        |
        read_command
        |
        set_command
        ;
param:  NUMBER
        |
        BOOL
        ;
read_command:
        TOKREAD STATEKEY
        {
            if (!strcmp($2, "temprature")) {
                printf("Heat = %d\n", temp);
            } else if (!strcmp($2, "state")) {
                printf("State = %d\n", state);
            }
        }
        ;
set_command:
        TOKSET STATEKEY param
        {
            if (!strcmp($2, "temprature")) {
                temp = atoi($3);
                printf("temrpature set to %d\n", temp);
            } else if (!strcmp($2, "state")) {
                state = !strcmp($3, "on");
                printf("State = %d\n", state);
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