nasm -felf32 encrypt.s
gcc -no-pie -m32 -fsanitize=address -o main encrypt.o main.c

