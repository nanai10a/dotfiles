" echom "load config..."
let plugin_vim_config_dir=expand("$HOME/.config/nvim/config")
let plugin_configs=split(glob(plugin_vim_config_dir . "/*.vim"))

for s:file in plugin_configs
    execute "source" s:file
    " echom "loaded" . s:file
endfor
" echom "loaded config."
