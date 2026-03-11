
// System V ABI (default for linux x86-64)
int add_sysv(int a, int b) {
    int x = a + 1;
    int y = b + 2;
    return x + y;
}

// cdecl (default for linux x86 32-bit)
int __attribute__((cdecl)) add_cdecl(int a, int b) {
    int x = a + 3;
    int y = b + 4;
    return x + y;
}
