
build:
	@echo Building proyect
	cd src/TP/Primera_Entrega && \
	bison -dyv Sintactico.y && \
	flex Lexico.l && \
	gcc lex.yy.c y.tab.c -o Primera

run:
	@echo Running Project
	cd src/TP/Primera_Entrega && \
	./Primera prueba.txt

