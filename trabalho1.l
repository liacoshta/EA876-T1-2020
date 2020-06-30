
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
%}


%%

[0-9]+  {
          yylval = atoi(yytext);
          return INT;
        }

[+]     {
          return SOMA;
        }

[(]  {
    return ABPAR;
  }

[)]  {
	return FEPAR;
   }
[*]    {
	return MUL;
	}

[-]     {
	return SUB;
	}
\n   {
         return EOL;
       }
[/]  {
	return DIV;
	}
[^]  {
	return EXP;
     } 

[ \t]+ ;

.     {yyerror("Token nao reconhecido!\n");}

%%

int yywrap() {
  return 1;
}
