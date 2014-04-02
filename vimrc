set nocompatible
set nocp
execute pathogen#infect()
syntax on
set number
set hlsearch
set nowrap
set autowrite
set directory=$HOME/.vim-temp/swapfiles//
filetype plugin indent on
colorscheme monokai
let mapleader = "\<Space>"
" remove trailing whitespace on save php, js
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.lua :%s/\s\+$//e
" save on ctrl-s
nnoremap <Leader>w <Esc>:update<CR>

" switching between views
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

let g:neocomplete#enable_at_startup                 = 1
let g:neocomplete#enable_auto_delimiter             = 1
let g:neocomplete#enable_insert_char_pre            = 1
let g:neocomplete#enable_smart_case                 = 1
let g:neocomplete#enable_auto_select                = 1
let g:neocomplete#enable_refresh_always             = 1

let g:UltiSnipsExpandTrigger ="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 35
let Tlist_Use_Right_Window = 1
let tlist_php_settings = 'php;c:class;f:function'
let Tlist_Show_One_File = 1
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --extra=+q .<CR>

map <Leader>r :CtrlPBufTag<CR>
map <Leader>t :CtrlP<CR>
let g:ctrlp_switch_buffer = 'Et'
set wildignore+=**/doxygen/*,**/store/*,**/system/*,**/temp/*,**/tests/*,**/shared/*,**/client/jquery/*,**/client/ckeditor/*,**/client/images/*,**/dbupdate/*
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-w> <Esc>:tabclose<CR>

let g:taboo_tab_format='[%1a]%m'

set shiftwidth=4
set tabstop=4

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

map <Leader>n <plug>NERDTreeTabsToggle<CR>

let g:syntastic_quiet_messages = { "type": "style" }
let g:airline_powerline_fonts=1

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
