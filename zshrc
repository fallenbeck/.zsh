# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Extend PATH
[ -d /opt/homebrew/bin ] && export PATH=/opt/homebrew/bin:$PATH
[ -d /usr/local/bin ] && export PATH=/usr/local/bin:$PATH
[ -d ~/bin ] && export PATH=~/bin:$PATH
if [[ ! "$PATH" == *$HOME/.config/zsh/plugins/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}$HOME/.config/zsh/plugins/fzf/bin"
fi
# export PATH=/opt/homebrew/bin:$PATH
# export PATH=/usr/local/bin:$PATH
# export PATH=~/bin:$PATH
# export PATH="${PATH:+${PATH}:}$HOME/.config/zsh/plugins/fzf/bin"

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


# Source plugins, fzf auto-completion, and fzf key bindings
for p in \
    ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
    ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    ~/.config/zsh/plugins/fzf/shell/completion.zsh \
    ~/.config/zsh/plugins/fzf/shell/key-bindings.zsh \
    ;
do
    [ -f $p ] && source $p
    # source $p
done

autoload -Uz compinit && compinit

# User configuration
[ -f ~/.myrc ] && source ~/.myrc
[ -f ~/.aliases ] && source ~/.aliases
#source ~/.myrc
#source ~/.aliases

# Load powerlevel10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# EOF
