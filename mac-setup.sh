#!/bin/bash

# macOS Dotfiles Setup Script
# Creates symlinks for configuration files

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}🔗 macOS Dotfiles Setup${NC}"
echo -e "Setting up symlinks from: ${SCRIPT_DIR}"
echo

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    
    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # If target already exists and is not a symlink, back it up
    if [[ -e "$target" && ! -L "$target" ]]; then
        echo -e "${YELLOW}⚠️  Backing up existing file: $target → $target.backup${NC}"
        mv "$target" "$target.backup"
    fi
    
    # Remove existing symlink if it exists
    [[ -L "$target" ]] && rm "$target"
    
    # Create the symlink
    ln -sf "$source" "$target"
    echo -e "${GREEN}✅ Linked: $target → $source${NC}"
}

echo -e "${BLUE}📁 Setting up configuration symlinks...${NC}"

# Tmux
create_symlink "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"
create_symlink "$SCRIPT_DIR/tmux" "$HOME/.tmux"

# Fish shell
create_symlink "$SCRIPT_DIR/config/fish" "$HOME/.config/fish"

# Kitty terminal
create_symlink "$SCRIPT_DIR/config/kitty" "$HOME/.config/kitty"

# Neovim
create_symlink "$SCRIPT_DIR/config/nvim" "$HOME/.config/nvim"

# Ghostty terminal
create_symlink "$SCRIPT_DIR/config/ghostty" "$HOME/.config/ghostty"

# skhd (hotkey daemon)
create_symlink "$SCRIPT_DIR/config/skhd" "$HOME/.config/skhd"
create_symlink "$SCRIPT_DIR/skhd" "$HOME/.skhd"

echo
echo -e "${GREEN}🎉 Setup complete!${NC}"
echo
echo -e "${YELLOW}📝 Next steps:${NC}"
echo "  1. Restart your terminal or run: source ~/.config/fish/config.fish"
echo "  2. Install tmux plugins: Prefix + I (Ctrl-a + I)"
echo "  3. Install Neovim plugins will happen automatically on first launch"
echo "  4. Restart skhd if you're using it: brew services restart skhd"
echo
echo -e "${BLUE}ℹ️  Note: Backed up files have .backup extension${NC}"