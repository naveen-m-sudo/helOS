# Define variables
AS=nasm
ASFLAGS=-f bin
OUTPUT=bin/boot.bin
SOURCE=src/boot.asm
QEMU=qemu-system-x86_64
QEMUFLAGS=-drive format=raw,file=$(OUTPUT)

# Default target
all: $(OUTPUT)

# Rule to assemble the bootloader
$(OUTPUT): $(SOURCE)
	$(AS) $(ASFLAGS) -o $(OUTPUT) $(SOURCE)

# Rule to run QEMU with the bootloader
run: $(OUTPUT)
	$(QEMU) $(QEMUFLAGS)

# Clean up generated files
clean:
	rm -f $(OUTPUT)

# Phony targets (not actual files)
.PHONY: all run clean
