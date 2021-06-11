scriptencoding utf-8
call plug#begin('~/.vim/plug')

Plug 'w0rp/ale'
Plug 'zaptic/elm-vim'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
"Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'

call plug#end()

syntax enable
filetype plugin indent on

"set t_Co=256

colorscheme molokai
let g:rehash256 = 1
let g:molokai_original = 1

set background=dark
"set background=light

set encoding=utf-8
set number
set textwidth=150
set showmatch
set novisualbell
set cul
set scrolloff=5

set nohlsearch
set incsearch
set smartcase
set ignorecase
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set shiftround
set copyindent
set preserveindent
set ruler

set undolevels=1000	
set backspace=indent,eol,start	

set foldmethod=marker

" Powerline
"set rtp+=/usr/share/powerline/bindings/vim/

" set autoread  
" au CursorHold,CursorHoldI * checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" TMUX integration -------------------------------------------------------------
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
" nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
" nnoremap <leader>= :wincmd =<cr>
"
" ELM-VIM -------------------------------------------------------------
let g:elm_delete_elm_stuff_on_fail = 1
let g:elm_format_autosave = 1

" ALE ------------------------------------------------------------------
let g:ale_set_quickfix = 0

" AIRLINE --------------------------------------------------------------
let g:airline_powerline_fonts = 1

" let g:airline_extensions = []
let g:airline_extensions = ['tabline', 'branch', 'ctrlp']

" if get(g:,'git_plugin_name') ==# 'vim-fugitive' && get(g:, 'feat_enable_git')
"     call add(g:airline_extensions, 'branch')
"     endif
" if get(g:, 'fuzzysearcher_plugin_name') ==# 'ctrlp'
"     call add(g:airline_extensions, 'ctrlp')
"     endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#fnamemod = ':p:t'
":hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
":hi TabLine ctermfg=Blue ctermbg=Yellow
":hi TabLineSel ctermfg=Red ctermbg=Yellow
hi airline_tabmod_unsel_right  ctermfg=232 ctermbg=166 guifg=#000000 guibg=#df5f00
hi airline_tabmod_unsel  ctermfg=232 ctermbg=166 guifg=#000000 guibg=#df5f00


let g:airline#extensions#hunks#enabled = 0

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ycm#enabled = 0
let g:airline#extensions#ctrlp#show_adjacent_modes = 0


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if get(g:,'airline_powerline_fonts') == 1
    let g:airline_symbols.branch = ''
else
    let g:airline_symbols.branch = '⎇'
endif
let g:airline_symbols.readonly = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.crypt = '🔒'

set hidden " this will go along

" quickfix navigation
nnoremap <leader><Down> :cn<CR>
nnoremap <leader><Up> :cp<CR>

let mapleader=' '

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader><Left> <Plug>AirlineSelectPrevTab
nmap <leader><Right> <Plug>AirlineSelectNextTab


au FileType elm nmap <leader>m <Plug>(elm-make)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>w <Plug>(elm-browse-docs)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)

" vnoremap // y/<C-R>"<CR>
vnoremap // <'I--<Esc>

nnoremap <leader>( ebi(<Esc> eli)<Esc>
nnoremap <leader>[ ebi[<Esc> eli]<Esc>
nnoremap <leader>" ebi"<Esc> eli"<Esc>
nnoremap <leader>' ebi'<Esc> eli'<Esc>
nnoremap <leader>{ ebi{<Esc> eli}<Esc>


nnoremap <S-Left> b
nnoremap <S-Right> w
nmap <S-Up> :cp<CR>
nmap <S-Down> :cn<CR>

vnoremap <S-Left> b
vnoremap <S-Right> w
vnoremap <S-Up> k
vnoremap <S-Down> j

nnoremap <C-Left> b
nnoremap <C-Right> w
nmap <C-Up> <C-v><Up>
nmap <C-Down> <C-v><Down>

vnoremap <C-Up> k
vnoremap <C-Down> j

map [1;5A <C-Up>
map [1;5B <C-Down>
map [1;5D <C-Left>
map [1;5C <C-Right>
map [1;2D <S-Left>
map [1;2C <S-Right>
map [1;2A <S-Up>
map [1;2B <S-Down>


set rnu " (relativenumber)
vnoremap § '<g0<C-v>'>g0I-- <Esc> 
vnoremap % <Esc>'<g0<C-v>'>g0lld<Esc> 

vmap f ?^\w<CR>jvaikkokk
map <F1> "zyiw:exe "vimgrep /^".@z."\\>/ src/**/*.elm"<CR>
map <F2> "zyiw:exe "vimgrep /^Type ".@z."\\>/ src/**/*.elm"<CR>
map <F3> "zyiw:exe "vimgrep /^Type alias ".@z."\\>/ src/**/*.elm"<CR>
map <F4> "zyiw:exe "vimgrep /\\<".@z."\\>/ src/**/*.elm"<CR>
map <F5> wbbb"zyw2w"syw:exe "vimgrep /\\<".@s."\\>/ src/elm/**/".@z.".elm"<CR>


map <leader>p 0yi":!mupdf <C-R>" & disown<CR><CR>

"Decision.init


" Compatible with ranger 1.4.2 through 1.7.*
"
" Add ranger as a file chooser in vim
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>
