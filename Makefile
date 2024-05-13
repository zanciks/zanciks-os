ASM=nasm
SRC_DIR=src
BUILD_DIR=build

all: $(BUILD_DIR)/main.img 
	qemu-system-x86_64 $(BUILD_DIR)/main.img -nographic

$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm 
	$(ASM) -f bin $(SRC_DIR)/main.asm -o $(BUILD_DIR)/main.bin

$(BUILD_DIR)/main.img: $(BUILD_DIR)/main.bin 
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main.img
	truncate -s 1440k $(BUILD_DIR)/main.img