ASM=nasm
SRC_DIR=src
BUILD_DIR=build

all: $(BUILD_DIR)/main.bin 
	qemu-system-x86_64 $(BUILD_DIR)/main.bin

$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm 
	$(ASM) -f bin $(SRC_DIR)/main.asm -o $(BUILD_DIR)/main.bin
