# Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
 
# # # Pure prompt
# fpath+=($HOME/.config/zsh/themes/pure)
# autoload -U promptinit; promptinit
# # # zstyle :prompt:pure:git:stash show yes
# prompt pure

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

# set up better history
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=$HISTSIZE

# zsh options
# see: https://zsh.sourceforge.io/Doc/Release/Options.html
setopt HIST_IGNORE_ALL_DUPS     # ignore duplicate commands in history list
setopt HIST_IGNORE_SPACE        # ignore commands that start with space
setopt HIST_VERIFY              # show command with history expansion
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
#setopt EXTENDED_HISTORY         # Write the history file in the ":start:elapsed;command" format.
#setopt INC_APPEND_HISTORY       # Write to the history file immediately, not when the shell exits.
#setopt SHARE_HISTORY            # Share history between all sessions/terminals.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS         # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS     # Delete old recorded entry if new entry is a duplicate.
#setopt HIST_FIND_NO_DUPS        # Do not display a line previously found.
setopt HIST_IGNORE_SPACE        # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS        # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY              # Don't execute immediately upon history expansion.
setopt HIST_BEEP                # Beep when accessing nonexistent history.

# Completion styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colorize completions

# NOTE: For correct functionality TERM should have been set to xterm-256color
# (and not xterm-kitty for example which would break thinks.)

# Source plugins, fzf auto-completion, and fzf key bindings
for p in \
    "${HOME}"/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
    "${HOME}"/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    ;
do
    [ -f "$p" ] && source "$p"
done

# basic ls configuration
export CLICOLOR=1
[ "$(uname)" = "Linux" ] && alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"

# Initialize fzf if installed
if [ -x "$(which fzf)" ]
then
  # Extend PATH
  if [[ ! "$PATH" == *$HOME/.config/zsh/plugins/fzf/bin* ]]; then
      PATH="${PATH:+${PATH}:}$HOME/.config/zsh/plugins/fzf/bin"
  fi

  # Load fzf functions
  for p in \
      "${HOME}"/.config/zsh/plugins/fzf/shell/*.zsh \
      "${HOME}"/.config/zsh/functions/*.zsh \
      ;
  do
      [ -f "$p" ] && source "$p"
  done
fi

# Powerlevel10k
# Load powerlevel10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source "${HOME}"/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f "${HOME}"/.p10k.zsh ]] || source "${HOME}"/.p10k.zsh

# # Use startship.rs when installed, otherwise use pure prompt
# if [ -x "$(which starship)" ]
# then
#   eval "$(starship init zsh)"
# else
#   fpath+=($HOME/.config/zsh/themes/pure)
#   autoload -U promptinit; promptinit
#   # # zstyle :prompt:pure:git:stash show yes
#   prompt pure
# fi

# Use zoxide when installed
if [ -x "$(which zoxide)" ]
then
  eval "$(zoxide init zsh)"
fi

# User configuration
[ -f "${HOME}"/.myrc ] && source "${HOME}"/.myrc
[ -f "${HOME}"/.aliases ] && source "${HOME}"/.aliases

# Return successfully in any case
return 0

# EOF
