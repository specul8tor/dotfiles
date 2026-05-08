export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
  . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
elif [ -x "/opt/homebrew/anaconda3/bin/conda" ]; then
  export PATH="/opt/homebrew/anaconda3/bin:$PATH"
fi

if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

[ -f "/opt/homebrew/share/google-cloud-sdk/path.zsh.inc" ] && source "/opt/homebrew/share/google-cloud-sdk/path.zsh.inc"
[ -f "/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc" ] && source "/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc"

fixfork() {
  local pids
  pids=$(pgrep -f 'Raycast Helper \(Extensions\)' 2>/dev/null) || return 0
  [ -n "$pids" ] || return 0
  kill -TERM ${=pids} 2>/dev/null
  sleep 1
  pids=$(pgrep -f 'Raycast Helper \(Extensions\)' 2>/dev/null)
  [ -n "$pids" ] && echo "Raycast helper restarted: $pids"
}

# OpenClaw completion (optional)
[ -f "$HOME/.openclaw/completions/openclaw.zsh" ] && source "$HOME/.openclaw/completions/openclaw.zsh"
