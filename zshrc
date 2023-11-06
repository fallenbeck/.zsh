# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Options
setopt autocd               # change directory bs just typing its name
setopt correct              # auto correct mistakes
setopt interactivecomments  # allow comments in interactive mode
setopt magicequalsubst      # enable filename expansion for arguments of the
                            # form 'anything=expression'
setopt nonomatch            # hide error messages if there is no match for pattern
setopt notify               # report the status for background jobs immediately
setopt numericglobsort      # sort filenames numerically when it makes sense
setopt promptsubst          # enable command substitution in prompt

# General
autoload -Uz compinit; compinit
autoload -Uz colors; colors
autoload history-search-end

# Smart Url
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Edit command line with EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line

# Extend PATH
[ -d /opt/homebrew/bin ] && export PATH=/opt/homebrew/bin:$PATH
[ -d /usr/local/bin ] && export PATH=/usr/local/bin:$PATH
[ -d ~/bin ] && export PATH=~/bin:$PATH
if [[ ! "$PATH" == *$HOME/.config/zsh/plugins/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}$HOME/.config/zsh/plugins/fzf/bin"
fi

# set up better history
setopt HIST_IGNORE_ALL_DUPS
export HISTSIZE=20000
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
    ~/.config/zsh/plugins/fzf/shell/*.zsh \
    ~/.config/zsh/functions/*.zsh \
    ;
do
    [ -f $p ] && source $p
done

# User configuration
[ -f ~/.myrc ] && source ~/.myrc
[ -f ~/.aliases ] && source ~/.aliases

# Load powerlevel10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# EOF
