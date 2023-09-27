#!/bin/bash


#!/bin/bash

# Check for root/sudo privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script requires superuser privileges to install dependencies. Please run with sudo or as root."
  exit 1
fi

# Install Rust (if not already installed)
if ! command -v rustc &> /dev/null; then
  echo "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source $HOME/.cargo/env
  echo "Rust installed successfully."
else
  echo "Rust is already installed."
fi

# Install SDL2 development library (assuming a Linux environment)
if ! command -v sdl2-config &> /dev/null; then
  echo "Installing libsdl2-dev..."
  apt-get update
  apt-get install -y libsdl2-dev
  echo "libsdl2-dev installed successfully."
else
  echo "libsdl2-dev is already installed."
fi

# Build and install your Rust project (assuming you have a Makefile)
echo "Building and installing your Rust project..."
cd stm32-emulator-main
make clean
make install

echo "Installation complete."
make clean

if $1 == 'clean'
then
    echo "Cleaning up all source code for the task"
    make clean
    make clean-src
    echo "Cleaned up."
fi

cd ..