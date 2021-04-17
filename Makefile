
build: clean
	@echo Building proyect
	mkdir bin
	cd src && \
	bison -tdv sintactico.y --output=sintactico.c && \
	flex --outfile=lexico.c lexico.l && \
	gcc *.c -o ../bin/compilador -std=c99;

ejercicio: clean
	@echo Building proyect ejercicio${nro}
	mkdir bin;
	cd src/practica/ejercicio$(nro) && \
	flex lexico.l && \
	gcc lex.yy.c -o ../../../bin/compilador

run:
	@echo Running Project
	bin/compilador ${file}

clean:
	@echo Cleaning proyect
	rm -rf bin
