%{
#include <stdio.h>

void yyerror(char *c);
int yylex(void);

%}

%token INT SOMA EOL SUB MUL ABPAR FEPAR
%left INT

%%

PROGRAMA:
        PROGRAMA EXPRESSAO EOL { printf("Resultado: %d\n", $2); }
        |
        ;


EXPRESSAO:
    INT { $$ = $1;
          }

    | ABPAR EXPRESSAO FEPAR {
       printf("Encontrei expressão entre parenteses");
	$$ = $2;
	 }
    | EXPRESSAO MUL EXPRESSAO {
	printf("Encontrei multiplicação: %d*%d = %d\n", $1, $3, $1*$3);
	$$ = $1*$3;
	}

    | EXPRESSAO SOMA EXPRESSAO  {
        printf("Encontrei soma: %d + %d = %d\n", $1, $3, $1+$3);
        $$ = $1 + $3;
        }
    | EXPRESSAO SUB EXPRESSAO{
	printf("Encontrei sub: %d - %d =%d\n", $1, $3, $1+$3);
	$$ = $1 - $3;
	}
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
  yyparse();
  return 0;

}
