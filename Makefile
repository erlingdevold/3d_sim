
# Make file for the project, 
# it will compile all the files and create the executable file
# Use the dockerfile for referecne


# Rust code, requires libsdl install on the system based on architecture
# this is the make file to build

# install rust and cargo

# Makefile for Rust project installation

# Define the Rust compiler and package manager
RUSTC := rustc
CARGO := cargo

# Define the name of your Rust project and the binary output name
PROJECT_NAME := 3d_sim
OUTPUT_NAME := stm32-emulator

# Define the installation directory (change as needed)
INSTALL_DIR := .

# Define the source directory
SRC_DIR := stm32-emulator-sim

# Define the build directory
BUILD_DIR := target

# Define the release or debug build mode (release by default)
BUILD_MODE := release

# Targets

all: build

build:
	$(CARGO) build --$(BUILD_MODE)

install: build
	install -m 755 $(BUILD_DIR)/$(BUILD_MODE)/$(OUTPUT_NAME) $(INSTALL_DIR)

uninstall:
	rm -f $(INSTALL_DIR)/$(OUTPUT_NAME)

clean:
	$(CARGO) clean
	rm -rf $(BUILD_DIR)

.PHONY: all build install uninstall clean
