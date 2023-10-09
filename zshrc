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
source /usr/local/Cellar/fzf/*/shell/key-bindings.zsh
source /usr/local/Cellar/fzf/*/shell/completion.zsh

# load plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# load git automcompletion
autoload -Uz compinit && compinit

# User configuration
[ -f ~/.myrc ] && source ~/.myrc
[ -f ~/.aliases ] && source ~/.aliases
