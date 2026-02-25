__attribute__((noinline))
int sum_positive_c(const int *arr, int n) {
    volatile int sum = 0; /* keep explicit branch, avoid cmov conversion */
    const int *p = arr;
    const int *end = arr + n;

    while (p < end) {
        int x = *p;
        if (x <= 0) {
            p++;
            continue;
        }
        sum += x;
        p++;
    }
    return sum;
}
