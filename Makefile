

all: lex.yy.c y.tab.c
	gcc -omain lex.yy.c y.tab.c -ll

lex.yy.c:trabalho1.l y.tab.c
	flex trabalho1.l

y.tab.c:trabalho1.y
	bison -dy trabalho1.y

clean:
	rm y.tab.c lex.yy.c y.tab.h main
