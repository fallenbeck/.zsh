# read starship prompt config
eval "$(starship init zsh)"

# editor configuration
export EDITOR=nvim

# add various bin locations to PATH
export PATH=$HOME/bin:$PATH

# set up better history
setopt HIST_IGNORE_ALL_DUPS
export HISTSIZE=100000
export SAVHIST=$HISTSIZE

# load fzf
export FZF_DEFAULT_OPTS='--border'
source /opt/homebrew/Cellar/fzf/*/shell/key-bindings.zsh
source /opt/homebrew/Cellar/fzf/*/shell/completion.zsh

# load plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# load git automcompletion
autoload -Uz compinit && compinit

# User configuration
[ -f ~/.myrc ] && source ~/.myrc
[ -f ~/.aliases ] && source ~/.aliases
