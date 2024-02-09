# Personal environment variable
export CNF=$HOME/cnf
export XDG_CONFIG_HOME=$HOME/.config

# Rust: source cargo env if existing
[ -r "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
