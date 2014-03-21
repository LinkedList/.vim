execute pathogen#infect()
syntax on
set number
set hlsearch
set nowrap
filetype plugin indent on
colorscheme monokai
let mapleader = "\<Space>"
" remove trailing whitespace on save php, js
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
" save on ctrl-s
nnoremap <Leader>w <Esc>:update<CR>
inoremap <Leader>w <Esc>:update<CR>

" switching between views
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" maximum of 20 items in a popup
let g:neocomplete#max_list = 20
" autoselect first
let g:neocomplete#enable_auto_select = 1
" enable autorefresh
let g:neocomplete#enable_refresh_always = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 35
let Tlist_Use_Right_Window = 1
let tlist_php_settings = 'php;c:class;f:function'
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --extra=+q .<CR>

map <Leader>r :CtrlPBufTag<CR>
let g:ctrlp_map = '<Leader>t' 
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_switch_buffer = 'Et'
set wildignore+=**/doxygen/*,**/store/*,**/system/*,**/temp/*,**/tests/*,**/shared/*,**/client/jquery/*,**/client/ckeditor/*,**/client/images/*,**/dbupdate/*
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>

let g:taboo_tab_format='[%1a]%m'

set shiftwidth=4
set tabstop=4

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

map <Leader>n <plug>NERDTreeTabsToggle<CR>

let g:syntastic_quiet_messages = { "type": "style" }
let g:airline_powerline_fonts = 1
