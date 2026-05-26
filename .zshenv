# SSH fallback: if the remote does not know this terminal type, use a safe default.
if [ -n "${SSH_CONNECTION:-}" ] && [ -n "${TERM:-}" ] && [ "$TERM" != "dumb" ]; then
  if ! command -v infocmp >/dev/null 2>&1 || ! infocmp "$TERM" >/dev/null 2>&1; then
    export TERM="xterm-256color"
  fi
fi
