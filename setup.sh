#!/bin/bash

# Define colors for output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/git/dotfiles"
REPO_URL="git@github.com:p3rception/dotfiles.git"

# Clone the repository if it doesn't exist
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${YELLOW}Cloning dotfiles repository...${NC}"
    git clone $REPO_URL $DOTFILES_DIR
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to clone repository!${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}Dotfiles repository already exists.${NC}"
    echo -e "${YELLOW}Pulling latest changes...${NC}"
    cd $DOTFILES_DIR
    git pull
    if [ $? -ne 0 ]; then
        echo -e "${RED}Failed to pull latest changes!${NC}"
        exit 1
    fi
fi

# List all dotfiles in the repository except README.md
echo -e "${YELLOW}Listing all dotfiles in the repository (excluding README.md):${NC}"
for file in $(ls -1 $DOTFILES_DIR); do
    if [ "$file" != "README.md" ]; then
        echo $file
    fi
done

# Create symbolic links
echo -e "${YELLOW}Creating symbolic links...${NC}"

LINKS=(
    "$DOTFILES_DIR/config/zshrc $HOME/.zshrc"
    "$DOTFILES_DIR/config/zsh_aliases $HOME/.zsh_aliases"
    "$DOTFILES_DIR/config/zsh_history $HOME/.zsh_history"
    "$DOTFILES_DIR/config/bashrc $HOME/.bashrc"
    "$DOTFILES_DIR/config/starship.toml $HOME/.config/starship.toml"
    "$DOTFILES_DIR/config/tmux.conf $HOME/.tmux.conf"
    "$DOTFILES_DIR/config/vimrc $HOME/.vimrc"
)

for LINK in "${LINKS[@]}"; do
    SRC=$(echo $LINK | awk '{print $1}')
    DEST=$(echo $LINK | awk '{print $2}')
    ln -sf $SRC $DEST
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Created symlink: $DEST -> $SRC${NC}"
    else
        echo -e "${RED}Failed to create symlink: $DEST${NC}"
    fi
done

echo -e "${GREEN}Dotfiles setup complete!${NC}"
