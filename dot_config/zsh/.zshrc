# plugins
if [[ ! -f $ZDOTDIR/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm $ZDOTDIR/.zpm
fi

source $ZDOTDIR/.zpm/zpm.zsh

zpm load zdharma-continuum/fast-syntax-highlighting
zpm load zsh-users/zsh-autosuggestions
zpm load jeffreytse/zsh-vi-mode

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

# completions
autoload -Uz compinit
compinit -iCd $ZDOTDIR/.zcompdump

zstyle ':completion:*:default' list-colors di=4 ex=33

zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate' max-errors 3 NUMERIC

# aliasing
alias lg=lazygit
alias cd=z
alias tj='trans -tl ja'
alias te='trans -tl en'

# booting
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
