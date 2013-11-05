prog: lexico.l sintatico.y funcoes.c list.c
	bison -d sintatico.y
	mv sintatico.tab.h sintatico.h
	mv sintatico.tab.c sintatico.c
	flex lexico.l
	mv lex.yy.c lexico.c
	gcc -o prog sintatico.c lexico.c funcoes.c list.c -I. -lm

clean:
	rm lexico.c sintatico.c sintatico.h programa.asm start.asm prog *~
