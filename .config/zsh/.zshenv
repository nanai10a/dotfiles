# ref. https://github.com/rust-lang/cargo/issues/1734
export  CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup

export PATH=$PATH:$CARGO_HOME/bin
