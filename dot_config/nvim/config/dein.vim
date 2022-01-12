let config_dir = expand("$HOME/.config/nvim")

if &compatible
  set nocompatible  " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(config_dir . "/dein")

execute "source" expand("$HOME/.config/nvim/dein/load.vim")
call dein#load_toml(config_dir . "/dein/load.toml", { "lazy" : 0 })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" call dein#recache_runtimepath()
" call map(dein#check_clean(), delete(v:val, 'rf')) // FIXME: 機能しない

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
