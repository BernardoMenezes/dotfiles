# --- Basics ---
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"

# Add Homebrew, Python, and other common paths
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:$PATH"

# Colors
autoload -U colors && colors

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# --- Aliases ---
alias ls='ls -G'
alias l='ls -G'
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'

# Use pip3 as default
alias pip="pip3"

# --- Claude Code sounds toggle ---
claude-sounds() {
  local f="$HOME/.claude/hooks/TOGGLE"
  if [[ "$(cat "$f" 2>/dev/null)" == "0" ]]; then
    echo "1" > "$f"
    echo "Claude sounds ON"
  else
    echo "0" > "$f"
    echo "Claude sounds OFF"
  fi
}

# --- Git branch helper ---
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

# --- Prompt ---
setopt PROMPT_SUBST

# Example prompt: user@host ~/current/path (gitbranch) %
PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %F{green}$(parse_git_branch)%f %# '

# Right prompt shows time
RPROMPT='%F{blue}%*%f'

# --- History ---
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

alias gcm='git fetch && git checkout --detach origin/main'

# --- Plugins (if you install oh-my-zsh) ---
# Uncomment if using oh-my-zsh
# plugins=(git z fzf)

# --- FZF (if installed via brew) ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- 1Password CLI (if using op) ---
if command -v op >/dev/null 2>&1; then
  if ! op whoami >/dev/null 2>&1; then
    eval "$(op signin --account my)"
  fi
fi
export PATH="$HOME/.local/bin:$PATH"

# --- I'm tired of typing pnpm install and pnpm start-dependencies
# # pnpm development setup alias with retry logic
pnpmfu() {
  echo "Running pnpm install..."
  pnpm install

  if [ $? -eq 0 ]; then
    echo "✓ pnpm install completed successfully"
    echo ""
    echo "Starting dependencies..."

    local max_retries=3
    local retry_count=0

    while [ $retry_count -lt $max_retries ]; do
      pnpm start-dependencies

      if [ $? -eq 0 ]; then
        echo "✓ Dependencies started successfully"
        return 0
      else
        retry_count=$((retry_count + 1))
        if [ $retry_count -lt $max_retries ]; then
          echo "✗ start-dependencies failed. Retrying ($retry_count/$max_retries)..."
          sleep 2
        else
          echo "✗ start-dependencies failed after $max_retries attempts"
          return 1
        fi
      fi
    done
  else
    echo "✗ pnpm install failed"
    return 1
  fi
}

# Disable annoying telemtry calls from turborepo
export VERCEL_TELEMETRY_DISABLED=1

# More files can be watched, so you can run `pnpm dev` on multiple workspaces at once
ulimit -n 65536
