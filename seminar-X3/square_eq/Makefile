CC := gcc
CFLAGS := -Wall -Wextra -Wpedantic -std=c11 -Iinclude -Iinclude/equasion -Iinclude/io
LDFLAGS :=
LDLIBS := -lm

BUILD_DIR := build
OBJ_DIR := $(BUILD_DIR)/obj

TARGET := $(BUILD_DIR)/square_eq
TEST_TARGET := $(BUILD_DIR)/test_square_eq

LIB_SOURCES := src/equasion/equasion.c src/io/io.c
APP_SOURCES := src/main.c $(LIB_SOURCES)
TEST_SOURCES := tests/test_solver.c

APP_OBJECTS := $(APP_SOURCES:%.c=$(OBJ_DIR)/%.o)
LIB_OBJECTS := $(LIB_SOURCES:%.c=$(OBJ_DIR)/%.o)
TEST_OBJECTS := $(TEST_SOURCES:%.c=$(OBJ_DIR)/%.o)

.PHONY: all clean test
 
all: $(TARGET)

$(TARGET): $(APP_OBJECTS)
	$(CC) $(APP_OBJECTS) $(LDFLAGS) -o $@ $(LDLIBS)

$(TEST_TARGET): $(LIB_OBJECTS) $(TEST_OBJECTS)
	$(CC) $(LIB_OBJECTS) $(TEST_OBJECTS) $(LDFLAGS) -o $@ $(LDLIBS)

$(OBJ_DIR)/%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

test: $(TEST_TARGET)
	./$(TEST_TARGET)

clean:
	rm -rf $(BUILD_DIR)
