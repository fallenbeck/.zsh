# Extend PATH
[ -d ~/bin ] && export PATH=~/bin:$PATH
[ -d /opt/homebrew/bin ] && export PATH=/opt/homebrew/bin:$PATH

# editor configuration
export EDITOR=nvim

# set up better history
setopt HIST_IGNORE_ALL_DUPS
export HISTSIZE=100000
export SAVHIST=$HISTSIZE

# Nice colors
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ll="ls -alG"

# Setup fzf
if [[ ! "$PATH" == *$HOME/.config/zsh/plugins/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.config/zsh/plugins/fzf/bin"
fi

# Source plugins, fzf auto-completion, and fzf key bindings
for p in \
    ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
    ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    ~/.config/zsh/plugins/fzf/shell/completion.zsh \
    ~/.config/zsh/plugins/fzf/shell/key-bindings.zsh \
    ;
do
    [ -f $p ] && source $p
done

autoload -Uz compinit && compinit

# User configuration
[ -f ~/.myrc ] && source ~/.myrc
[ -f ~/.aliases ] && source ~/.aliases

# read starship prompt config
[ ! -z "$(which starship)" ] && eval "$(starship init zsh)"

