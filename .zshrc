#
# .zshrc
#
# @author Jonathan Robic
#

# Colors.
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Don't require escaping globbing characters in zsh.
unsetopt nomatch

source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
# antigen bundle heroku
antigen bundle pip
# antigen bundle lein
antigen bundle command-not-found
antigen bundle history
antigen bundle history-substring-search
antigen bundle common-aliases
antigen bundle docker
antigen bundle npm
antigen bundle pnpm
antigen bundle yarn
antigen bundle node
antigen bundle npx
antigen bundle completion
antigen bundle ssh
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
# antigen theme https://github.com/ahmadawais/shades-of-purple-iterm2 shades-of-purple

# Tell Antigen that you're done.
antigen apply

# Custom $PATH with extra locations.
export PATH=$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/go/bin:/usr/local/git/bin:$HOME/.composer/vendor/bin:$PATH

# User configuration
export EDITOR='vim'

alias zshconfig="vim ~/.zshrc"
# reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'

# Include alias file (if present) containing aliases for ssh, etc.
[[ -f ~/.aliases ]] && source ~/.aliases

# Set architecture-specific brew share path.
arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
  share_path="/usr/local/share"
elif [ "${arch_name}" = "arm64" ]; then
  share_path="/opt/homebrew/share"
else
  echo "Unknown architecture: ${arch_name}"
fi

# Allow history search via up/down keys.
source ${share_path}/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z
source /usr/local/etc/profile.d/z.sh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

export N_PREFIX = "$HOME/n"
[[ :$PATH: = *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n-installed (see http://git.io/n-install-repo)

# Completions.
autoload -Uz compinit && compinit
# Case insensitive.
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800
