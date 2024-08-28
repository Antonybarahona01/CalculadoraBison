%{
#  include <stdio.h>
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS POW
%token OP CP
%token EOL

%%

calclist: /* nothing */
 | calclist exp EOL { printf("= %d\n> ", $2); }
 | calclist EOL { printf("> "); } /* blank line or a comment */
 ;

exp: factor
 | exp ADD exp { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 | exp ABS factor { $$ = $1 | $3; }
 | SUB exp { $$ = -$2; } 
 | exp POW exp {
        int result = 1;
        for (int i = 0; i < $3; i++) {
            result *= $1;
        }
        $$ = result;
     }
 | ABS exp { $$ = $2 >= 0 ? $2 : -$2; }
 ;

factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;

term: NUMBER
 | OP exp CP { $$ = $2; }
 ;
%%
main()
{
  printf("> ");
  yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
