
#define _POSIX_C_SOURCE 200809L

#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define HOT_VALUE_THRESHOLD 0x80000000u

typedef struct Node {
    uint32_t value;
    struct Node *next;
} Node;

uint32_t hot_function(Node *head, uint32_t rounds);
static Node *make_list(size_t count);
static double seconds_since(const struct timespec *start, const struct timespec *end);

int main(int argc, char **argv)
{
    const size_t node_count = (argc > 1) ? (size_t)strtoull(argv[1], NULL, 10) : 50000u;
    const uint32_t rounds = (argc > 2) ? (uint32_t)strtoul(argv[2], NULL, 10) : 1000u;
    const unsigned repeats = (argc > 3) ? (unsigned)strtoul(argv[3], NULL, 10) : 1u;

    if (node_count == 0 || rounds == 0 || repeats == 0) {
        fprintf(stderr, "usage: %s [node_count>0] [rounds>0] [repeats>0]\n", argv[0]);
        return 2;
    }

    Node *head = make_list(node_count);
    if (head == NULL) {
        fprintf(stderr, "failed to allocate %zu list nodes\n", node_count);
        return 1;
    }

    struct timespec start;
    struct timespec end;
    uint32_t checksum = 0;

    clock_gettime(CLOCK_MONOTONIC, &start);
    for (unsigned i = 0; i < repeats; ++i) {
        checksum ^= hot_function(head, rounds);
    }
    clock_gettime(CLOCK_MONOTONIC, &end);

#ifdef USE_ASM_IMPL
    const char *impl = "asm";
#else
    const char *impl = "c";
#endif

    printf("impl=%s nodes=%zu rounds=%" PRIu32 " repeats=%u checksum=%" PRIu32 " seconds=%.6f\n",
           impl, node_count, rounds, repeats, checksum, seconds_since(&start, &end));

    free(head);
    return 0;
}
static Node *make_list(size_t count)
{
    Node *nodes = calloc(count, sizeof(*nodes));
    if (nodes == NULL) {
        return NULL;
    }

    for (size_t i = 0; i < count; ++i) {
        nodes[i].value = (uint32_t)(i * 2654435761u + 1013904223u); // some hash
        nodes[i].next = (i + 1 < count) ? &nodes[i + 1] : NULL;
    }

    return nodes;
}

static double seconds_since(const struct timespec *start, const struct timespec *end)
{
    return (double)(end->tv_sec - start->tv_sec) +
           (double)(end->tv_nsec - start->tv_nsec) / 1000000000.0;
}

#ifndef USE_ASM_IMPL
__attribute__((noinline))
uint32_t hot_function(Node *head, uint32_t rounds)
{   
    uint32_t sum = 0;

    for (uint32_t r = 0; r < rounds; ++r) {
        for (Node *node = head; node != NULL; node = node->next) {
            if (node->value >= HOT_VALUE_THRESHOLD) {
                sum += node->value; 
            }
        }
    }

    return sum;
}
#endif
