#include <stdio.h>

typedef struct Node {
    int value;
    struct Node *next;
} Node;

static Node *g_p = NULL;

__attribute__((noinline)) // just for compiler to not inline this function, ignore it
int lazy_chain(void) {
    if (g_p && g_p->next && g_p->next->value > 0) {
        return 1;
    }
    return 0;
}

__attribute__((noinline)) // just for compiler to not inline this function, ignore it
int eager_chain(void) {
    int c1 = (g_p != NULL);
    int c2 = (g_p != NULL && g_p->next != NULL);
    int c3 = (g_p != NULL && g_p->next != NULL && g_p->next->value > 0);
    if (c1 & c2 & c3) {
        return 1;
    }
    return 0;
}

int main(void) {
    Node tail = {.value = 7, .next = NULL};
    Node head = {.value = 1, .next = &tail};

    g_p = NULL;
    printf("NULL    -> lazy=%d eager=%d\n", lazy_chain(), eager_chain());

    g_p = &head;
    printf("non-NULL-> lazy=%d eager=%d\n", lazy_chain(), eager_chain());
    return 0;
}
