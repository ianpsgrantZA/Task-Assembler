build: main.o 
	ld -o bin/main bin/main.o

main.o:
	mkdir bin
	touch bin/main.o
	nasm -f elf64 -o bin/main.o src/main.asm
	
run:
	bin/main
	