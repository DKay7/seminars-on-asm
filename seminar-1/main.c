// RUN: clang -S -masm=intel -O0 main.c -o main.s

// we avoid include since we are going to look at asm
int printf(const char *, ...);

static int x;

int main() { printf("Hello world!\n"); }
