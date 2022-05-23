# TODO: is need to move on `/etc/environment` ?
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json

export DENO_INSTALL=$HOME/.deno
export PNPM_HOME=$HOME/.local/share/pnpm

PATH=$HOME/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$HOME/go/bin:$PATH
PATH=$PNPM_HOME:$PATH
PATH=$DENO_INSTALL/bin:$PATH

echo $HOME/.gem/ruby/*/bin | sd ' ' ':' | read __tmp
export PATH=$__tmp:$PATH
unset __tmp

export PATH

eval "$(fnm env --use-on-cd)"
zshexit() {
    rm $FNM_MULTISHELL_PATH
}

if [[ "$XDG_SESSION_TYPE" = "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
fi
