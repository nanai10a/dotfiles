# plugins
if [[ ! -f $ZDOTDIR/.zr ]] || [[ $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zr ]]; then
    zr \
        zsh-users/zsh-syntax-highlighting \
        zsh-users/zsh-autosuggestions \
        jeffreytse/zsh-vi-mode \
        >$ZDOTDIR/.zr
fi

source $ZDOTDIR/.zr

## jeffreytse/zsh-vi-mode: clipboard compatible settings
if [[ $XDG_SESSION_TYPE = 'wayland' ]]; then
    zvm_vi_yank_command='wl-clip'
elif
    [[ $XDG_SESSION_TYPE = 'x11' ]]
then
    zvm_vi_yank_command='xclip -sel c'
fi

zvm_vi_yank() {
    zvm_yank
    printf %s "${CUTBUFFER}" | eval $zvm_vi_yank_command
    zvm_exit_visual_mode
}

# configure options
setopt extended_glob
setopt hist_verify

## configure history
export HISTFILE=$HOME/.cache/.zsh_history
export HISTSIZE=300
export SAVEHIST=100000

setopt extended_history
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_expand
setopt inc_append_history

# aliasing
alias lg=lazygit
alias denvm=$HOME/.cargo/bin/dvm
alias disvm=/bin/dvm
alias history-all=history -E 1

# booting
eval "$(starship init zsh)"
