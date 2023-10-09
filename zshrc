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
if [ -d /usr/local/Cellar/fzf ]
then
    source /usr/local/Cellar/fzf/*/shell/key-bindings.zsh
    source /usr/local/Cellar/fzf/*/shell/completion.zsh
fi
if [ -d /opt/homebrew/Cellar/fzf ]
then
    source /opt/homebrew/Cellar/fzf/*/shell/key-bindings.zsh
    source /opt/homebrew/Cellar/fzf/*/shell/completion.zsh
fi

# load plugins
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# load git automcompletion
autoload -Uz compinit && compinit

# User configuration
[ -f ~/.myrc ] && source ~/.myrc
[ -f ~/.aliases ] && source ~/.aliases
