#!/bin/bash
DOTFILES_DIR=~/dotfiles
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone git@github.com:p3rception/dotfiles.git $DOTFILES_DIR
fi
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/.zshrc_aliases ~/.zshrc_aliases
ln -sf $DOTFILES_DIR/.zshrc_history ~/.zshrc_history
ln -sf $DOTFILES_DIR/.bashrc ~/.bashrc
mkdir -p ~/.config
ln -sf $DOTFILES_DIR/.config/starship.toml ~/.config/starship.toml
mkdir -p ~/.kube
ln -sf $DOTFILES_DIR/kubeconfig ~/.kube/config
ln -sf $DOTFILES_DIR/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES_DIR/.kube/config ~/.kube/config
echo "Dotfiles setup complete!"
