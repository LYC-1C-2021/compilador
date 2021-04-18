
build:
	@echo Building proyect
	cd src/TP/Primera_Entrega && \
	bison -dyv Sintactico.y && \
	Flex Lexico.l && \
	gcc lex.yy.c y.tab.c -o Primera

run:
	@echo Running Project
	./Primera prueba.txt

