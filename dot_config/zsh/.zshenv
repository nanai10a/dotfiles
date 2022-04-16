# TODO: is need to move on `/etc/environment` ?
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json

export NVM_DIR="$HOME/.nvm"
export DENO_INSTALL=$HOME/.deno

PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/go/bin
PATH=$PATH:$DENO_INSTALL/bin

echo $HOME/.gem/ruby/*/bin | sd ' ' ':' | read __tmp
export PATH=$PATH:$__tmp
unset __tmp

export PATH

eval "$(fnm env --use-on-cd | sd '=(.*):\$PATH' '=$$PATH:$1')"
zshexit() {
    rm $FNM_MULTISHELL_PATH
}

if [[ "$XDG_SESSION_TYPE" = "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
fi
