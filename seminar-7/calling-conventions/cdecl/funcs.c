// RUN: gcc -m32 -O0 -fno-omit-frame-pointer -no-pie -c funcs32.c -o funcs32.o

// attribute cdecl is useless since we compiling with -m32,
// byt i'll leave it 
int __attribute__((cdecl)) add_cdecl(int a, int b) {
    int x = a + 3;
    int y = b + 4;
    return x + y;
}
