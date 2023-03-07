%{
    /*Definition section */
    #include <stdio.h>
    void yyerror(const char *str);
%}

%token NUMBER

%%
root: expr { printf("result = %d\n", $$); return 0; }
expr :
        expr '+' NUMBER
        {
            $$ = $1 + $3;
        }
        |
        expr '-' NUMBER
        {
            $$ = $1 - $3;
        }
        |
        NUMBER
        {
            $$ = $1;
        }

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