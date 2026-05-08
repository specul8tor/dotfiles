export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"

case ":$PATH:" in
  *":/opt/homebrew/bin:"*) ;;
  *) export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH" ;;
esac

case ":${INFOPATH:-}:" in
  *":/opt/homebrew/share/info:"*) ;;
  *) export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}" ;;
esac
