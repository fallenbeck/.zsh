# Extend PATH
#[ -d /opt/homebrew/bin ] && export PATH=/opt/homebrew/bin:$PATH
#[ -d /usr/local/bin ] && export PATH=/usr/local/bin:$PATH
#[ -d ~/bin ] && export PATH=~/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/bin:$PATH
export PATH="${PATH:+${PATH}:}$HOME/.config/zsh/plugins/fzf/bin"

# read starship prompt config
#[ ! -z "$(which starship)" ] && eval "$(starship init zsh)"
eval "$(starship init zsh)"

# editor configuration
export EDITOR=nvim

# set up better history
setopt HIST_IGNORE_ALL_DUPS
export HISTSIZE=100000
export SAVHIST=$HISTSIZE

# Prettier colorization
export CLICOLOR=1
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#if [[ ! "$PATH" == *$HOME/.config/zsh/plugins/fzf/bin* ]]; then
#    PATH="${PATH:+${PATH}:}$HOME/.config/zsh/plugins/fzf/bin"
#fi

# Source plugins, fzf auto-completion, and fzf key bindings
for p in \
    ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
    ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    ~/.config/zsh/plugins/fzf/shell/completion.zsh \
    ~/.config/zsh/plugins/fzf/shell/key-bindings.zsh \
    ;
do
    #[ -f $p ] && source $p
    source $p
done

autoload -Uz compinit && compinit

# User configuration
#[ -f ~/.myrc ] && source ~/.myrc
#[ -f ~/.aliases ] && source ~/.aliases
source ~/.myrc
source ~/.aliases

# EOF
