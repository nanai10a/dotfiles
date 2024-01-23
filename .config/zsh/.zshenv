# ref. https://github.com/rust-lang/cargo/issues/1734
export  CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup

export PATH=$PATH:$CARGO_HOME/bin

# ref. https://wiki.archlinux.org/title/Git#Signing_commits
export GPG_TTY=$(tty)

# ref. https://wiki.archlinux.org/title/Fcitx5#Integration
export GLFW_IM_MODULE=fcitx
export  GTK_IM_MODULE=fcitx
export   QT_IM_MODULE=fcitx
export  SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
