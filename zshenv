# Personal environment variable
export CNF=$HOME/cnf
export XDG_CONFIG_HOME=$HOME/.config

# Source ~/.profile if existing
[ -r $HOME/.profile ] && . "$HOME/.profile"

# Rust: source cargo env if existing
[ -r "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
