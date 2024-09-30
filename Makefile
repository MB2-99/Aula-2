BIN_DIR = binary
INC_DIR = include
LIB_DIR = lib
OBJ_DIR = object
SRC_DIR = source
DEP_DIR = dependencies

CC = clang
CFLAGS = -g -Wall -fsanitize=address -MMD -MP -MF $(DEP_DIR)/$*.d -I $(INC_DIR)

EXECS = $(BIN_DIR)/bad_memory $(BIN_DIR)/exercicio_gdb

make: $(EXECS)

$(BIN_DIR)/bad_memory: $(OBJ_DIR)/bad_memory.o
	$(CC) -fsanitize=address $^ -o $@

$(BIN_DIR)/exercicio_gdb: $(OBJ_DIR)/exercicio_gdb.o
	$(CC) -fsanitize=address $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c 
	$(CC) $(CFLAGS) -c $< -o $@

include $(wildcard $(DEP_DIR)/*.d)

clean:
	rm -rf $(DEP_DIR)/* $(OBJ_DIR)/* $(BIN_DIR)/*
