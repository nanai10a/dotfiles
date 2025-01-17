# ref. https://github.com/rust-lang/cargo/issues/1734
export  CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup

# ref. https://wiki.archlinux.org/title/Git#Signing_commits
export GPG_TTY=$(tty)

export EDITOR=nvim

# ref. https://wiki.archlinux.org/title/Fcitx5#Integration
export GLFW_IM_MODULE=fcitx
export  GTK_IM_MODULE=fcitx
export   QT_IM_MODULE=fcitx
export  SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# ref. https://wiki.archlinux.org/title/Wayland#Environment_variable
export ELECTRON_OZONE_PLATFORM_HINT=wayland
