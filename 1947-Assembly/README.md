-------------------------------
# Assembly Language
-------------------------------

### Goals
1. IO
2. task schedular
3. use for a month


### Running instructions
```
nasm -f elf64 -o hello.o hello.s
ld -o hello hello.o
./hello
```