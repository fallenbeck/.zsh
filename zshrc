# .zshrc
#
# I went away from oh-my-zsh to get a single .zshrc file that can easily be
# copied to other machines when needed.
#
# Document structure
# 1. Plugins
# 2. Prompt
# 3. History
# 4. Completion



# ==========
# 1. Plugins
# ==========

PLUGINS=~/.zsh/plugins

# if [ -f $PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]
# then
#     source $PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#
#     bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
#     bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
#     bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
#     zstyle ':autocomplete:*' min-delay 0.05  # seconds (float)
#     zstyle ':autocomplete:*' ignored-input '..##'
# fi

if [ -f $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]
then
    source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
fi

if [ -f $PLUGINS/zsh-completions/zsh-completions.plugin.zsh ]
then
    source $PLUGINS/zsh-completions/zsh-completions.plugin.zsh
fi

if [ -f $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]
then
    source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi



# =========
# 2. Prompt
# =========

# Set up the prompt
autoload -Uz promptinit
promptinit
# prompt adam1
# prompt suse

autoload -U colors && colors
# PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info

# Git status
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# add ${vcs_info_msg_0} to the prompt
#PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%{$fg[red]%}${vcs_info_msg_0_}%{$reset_color%} %% '
PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m:%{$fg[yellow]%}%~ %{$reset_color%}%{$fg[red]%}${vcs_info_msg_0_}%{$reset_color%} %% '



# ==========
# 3. History
# ==========

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history

# for non-pattern search like in bash 
#bindkey "^R" history-incremental-search-backward
# for pattern search (the wildcard `*` will use zsh completion)
#bindkey "^R" history-incremental-pattern-search-backward

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# =============
# 4. Completion
# =============

# Use modern completion system
# Commented out due the use of zsh-autocompelete
autoload -Uz compinit
compinit

# Color handling
# https://unix.stackexchange.com/questions/91937/mac-os-x-dircolors-not-found
if whence dircolors >/dev/null; then
    eval "$(dircolors -b)"
    # zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    # Aliases are set in ~/.myrc
    # alias ls='ls --color'
else
    export CLICOLOR=1
    zstyle ':completion:*:default' list-colors ''
fi

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# User configuration
[ -f ~/.myrc ] && source ~/.myrc
[ -f ~/.aliases ] && source ~/.aliases

if [ -f ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme ]
then
    source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
    [ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
fi

# EOF
