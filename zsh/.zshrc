### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# prompt() {
#     PS1="$(powerline-rs --shell zsh $?)"
# }
# precmd_functions+=(prompt) # powerline-rsの導入

export EDITOR=nvim # エディタをnvimに設定

setopt IGNOREEOF # ctrl+dでのlogoutのignore

setopt auto_pushd # directory-stackにcdした時にpushする(?)
setopt pushd_ignore_dups # ↑でduplicateをignore

setopt extended_glob # ワイルドカード展開を使用

# setopt correct # コマンドのスペルチェック

# autoload -Uz compinit ; compinit #  自動補完の有効化

# setopt complete_in_word # 単語の途中での補完の有効化

setopt histignorealldups # historyの重複のignore

setopt share_history # 他terminalとのhistoryの共有

setopt hist_reduce_blanks # historyする時に余分な空白の削除

setopt inc_append_history # historyにすぐにpush

setopt hist_verify # historyの呼び出し後の編集が可能になる


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json


zinit ice wait '0'; zinit load momo-lab/zsh-abbrev-alias # 略語を展開する
zinit ice wait '0'; zinit load zsh-users/zsh-syntax-highlighting # 実行可能なコマンドに色付け
zinit ice wait '0'; zinit load zsh-users/zsh-completions # 補完
zinit ice wait '0'; zinit load zsh-users/zsh-autosuggestions #うっすら補完

export PATH=$PATH:$HOME/.gem/ruby/3.0.0/bin
export PATH=$PATH:$HOME/Downloads/Aseprite/build/bin

eval "$(starship init zsh)"

