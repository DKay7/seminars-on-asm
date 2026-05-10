#include <stdio.h>
#include <stdlib.h>

// encrypts with ceasers cypher
void asm_encrypt(char *buffer, char shift);

// reads file to buffer
void asm_read_file(const char *name, char **buffer);

// writes file from buf
void asm_write_file(const char *name, char *buffer);

int main(int argc, const char **argv) {
  //
  // read user's file
  //
  // call asm's function to encrypt it
  //
  // call asm's function to write file down
  //

  if (argc != 3) {
    printf("Usage: %s <input_file_path> <shift>", argv[0]);
    return 1;
  }

  int shift = atoi(argv[2]);

  char *buffer = NULL;
  asm_read_file(argv[1], &buffer);

  if (!buffer) {
    fprintf(stderr, "read failed\n");
    return 1;
  }
  /* FILE* input = fopen(argv[1], "r"); */
  /* fscanf(input, "%m[^\n]", &buffer); */
  /* fclose(input); */
  printf("%s\n", buffer);

  asm_encrypt(buffer, shift);

  /* FILE *output = fopen(argv[1], "w"); */
  /* fprintf(output, "%s", buffer); */
  /* fclose(output); */

  asm_write_file(argv[1], buffer);

  free(buffer);
}
