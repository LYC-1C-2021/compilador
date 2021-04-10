build: clean
	@echo Building proyect
	mkdir bin && cd src &&  flex lexico.l && gcc lex.yy.c -o ../bin/lexico && cd ..

run:
	@echo Running Project
	bin/lexico

clean:
	@echo Cleaning proyect
	rm -rf bin
