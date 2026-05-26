#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
STAMP="$(date +%Y%m%d-%H%M%S)"

link_path() {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ]; then
    local current
    current="$(readlink "$dst")"
    if [ "$current" = "$src" ]; then
      echo "ok: $dst"
      return 0
    fi
    mv "$dst" "${dst}.backup-${STAMP}"
  elif [ -e "$dst" ]; then
    mv "$dst" "${dst}.backup-${STAMP}"
  fi

  ln -s "$src" "$dst"
  echo "linked: $dst -> $src"
}

link_path "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
link_path "$DOTFILES_DIR/.config/tmux" "$HOME/.config/tmux"
link_path "$DOTFILES_DIR/.config/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
link_path "$DOTFILES_DIR/.zshenv" "$HOME/.zshenv"
link_path "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_path "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"

echo "Done."
