#!/bin/bash

# macOS Dependencies Installation Script
# Installs all necessary tools and dependencies

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 macOS Dependencies Installation${NC}"
echo -e "This script will install all necessary dependencies for your development environment"
echo

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install with error handling
install_package() {
    local package="$1"
    echo -e "${YELLOW}📦 Installing $package...${NC}"
    if brew install "$package"; then
        echo -e "${GREEN}✅ Successfully installed $package${NC}"
    else
        echo -e "${RED}❌ Failed to install $package${NC}"
        return 1
    fi
}

# Install Homebrew
echo -e "${BLUE}🍺 Installing Homebrew...${NC}"
if command_exists brew; then
    echo -e "${GREEN}✅ Homebrew already installed${NC}"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    echo -e "${GREEN}✅ Homebrew installed${NC}"
fi

# Update Homebrew
echo -e "${YELLOW}🔄 Updating Homebrew...${NC}"
brew update

# Install core development tools
echo -e "${BLUE}🛠️  Installing core development tools...${NC}"

# Fish shell
install_package "fish"

# Neovim
install_package "neovim"

# Font Iosevka
echo -e "${YELLOW}📦 Installing Iosevka Nerd Font...${NC}"
brew tap homebrew/cask-fonts
brew install --cask font-iosevka-nerd-font

# Tmux
install_package "tmux"

# Command line tools
install_package "wget"
install_package "luarocks"
install_package "fd"
install_package "ripgrep"
install_package "httpie"
install_package "go"
install_package "zoxide"
install_package "jq"

# 7zip
install_package "p7zip"

# skhd
install_package "skhd"

# Applications via Cask
echo -e "${BLUE}💻 Installing GUI applications...${NC}"

# Visual Studio Code
echo -e "${YELLOW}📦 Installing Visual Studio Code...${NC}"
brew install --cask visual-studio-code

# Kitty terminal
echo -e "${YELLOW}📦 Installing Kitty terminal...${NC}"
brew install --cask kitty

# Install clippy (Rust clipboard tool)
echo -e "${BLUE}🦀 Installing Rust and clippy...${NC}"
if command_exists rustc; then
    echo -e "${GREEN}✅ Rust already installed${NC}"
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source ~/.cargo/env
fi

# Install clippy
rustup component add clippy

# Install NVM and Node.js
echo -e "${BLUE}📦 Installing NVM and Node.js...${NC}"
if [[ -d ~/.local/share/nvm ]]; then
    echo -e "${GREEN}✅ NVM already installed${NC}"
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    
    # Create NVM directory structure for Fish
    mkdir -p ~/.local/share
    mv ~/.nvm ~/.local/share/nvm
fi

# Source NVM for this session
export NVM_DIR="$HOME/.local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install latest LTS Node.js
echo -e "${YELLOW}📦 Installing Node.js LTS...${NC}"
nvm install --lts
nvm use --lts

# Install global Node.js packages for Neovim
echo -e "${BLUE}📦 Installing Node.js packages for Neovim...${NC}"
npm install -g neovim
npm install -g tree-sitter-cli

# Install Python packages for Neovim
echo -e "${BLUE}🐍 Installing Python packages for Neovim...${NC}"
if command_exists python3; then
    python3 -m pip install --user neovim pynvim
else
    echo -e "${YELLOW}⚠️  Python3 not found, install it manually if needed${NC}"
fi

# Note about Fish shell
echo -e "${BLUE}🐟 Fish shell installed${NC}"
echo -e "${YELLOW}ℹ️  To set Fish as default shell, run:${NC}"
echo -e "  echo \$(which fish) | sudo tee -a /etc/shells"
echo -e "  chsh -s \$(which fish)"

echo
echo -e "${GREEN}🎉 Installation complete!${NC}"
echo
echo -e "${YELLOW}📝 Next steps:${NC}"
echo "  1. Set Fish as default shell (commands shown above)"
echo "  2. Restart your terminal or start a new session"
echo "  3. Run the setup script: ./mac-setup.sh"
echo "  4. Install tmux plugins: Ctrl-a + I"
echo
echo -e "${YELLOW}🔧 Services to start manually (if needed):${NC}"
echo "  • skhd (hotkey daemon): brew services start skhd"
echo
echo -e "${BLUE}ℹ️  Installed tools:${NC}"
echo "  • Homebrew (package manager)"
echo "  • Fish shell (default shell)"
echo "  • Neovim (text editor)"
echo "  • Iosevka Nerd Font"
echo "  • Tmux (terminal multiplexer)"
echo "  • Development tools: wget, fd, ripgrep, httpie, go, jq, p7zip"
echo "  • Rust with clippy"
echo "  • Zoxide (smart cd)"
echo "  • Visual Studio Code"
echo "  • Kitty terminal"
echo "  • skhd (hotkey daemon)"
echo "  • NVM with Node.js LTS"
echo "  • Node.js packages: neovim, tree-sitter-cli"
echo "  • Python packages: neovim, pynvim"