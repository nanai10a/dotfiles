set clipboard=unnamed
set expandtab
set list

set shiftwidth=4

set noshowmode
language en_US.utf8

nnoremap <Down> <NOP>
nnoremap <Up> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

nnoremap o <NOP>
nnoremap O <NOP>
nnoremap s <NOP>
nnoremap S <NOP>
nnoremap r <NOP>
nnoremap R <NOP>

nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l

nnoremap sc <C-w>c
nnoremap sr <C-w>r

nnoremap <A-j> <C-w>J
nnoremap <A-k> <C-w>K
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>L

nnoremap Sj :new<CR><C-w>j
nnoremap Sk :new<CR><C-w>j<C-w>J
nnoremap Sh :vnew<CR><C-w>l<C-w>H
nnoremap Sl :vnew<CR><C-w>l

nnoremap <C-w>j <C-Down>
nnoremap <C-w>k <C-Up>
nnoremap <C-w>h <NOP>
nnoremap <C-w>l <NOP>

nnoremap <C-w>J :tabnew<CR>
nnoremap <C-w>K :tabnew<CR>:tabmove -1<CR>
nnoremap <C-w>H :tabmove -1<CR>
nnoremap <C-w>L :tabmove +1<CR>

nnoremap <C-w>c :tabc<CR>
nnoremap <C-w>r :tabrewind<CR>

nnoremap J <NOP>

command! -nargs=0 W :w
command! -nargs=0 Wq :wq
