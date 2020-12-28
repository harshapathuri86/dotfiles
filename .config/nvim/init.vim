if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Plugins
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'dense-analysis/ale'
Plug 'sjl/gundo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

if (has('nvim'))
        " show results of substition as they're happening
        " but don't open a split
        set inccommand=nosplit
    endif

filetype plugin indent on " enable file type detection
set encoding=UTF-8
set history=1000 " more history
set textwidth=120
set backspace=indent,eol,start " make backspace behave in a sane manner
set nocompatible " not vi compatible
syntax on " turn on syntax highlighting
set autoindent
set nu " number lines
set rnu
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set lbr " line break
set scrolloff=5 " show lines above and below cursor (when possible)
set sidescrolloff=5
set spell " disabled spell check
set tabpagemax=40
set laststatus=2
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set hidden " allow auto-hiding of edited buffers
set nojoinspaces " suppress inserting two spaces between sentences
set autoread
set wrap " turn on line wrapping
set linebreak " set soft wrapping
set showbreak=↪
set ttyfast " faster redrawing
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set cmdheight=1 " command bar height
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set updatetime=300
set shortmess+=c
au VimResized * :wincmd =

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expression contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

" if has('mouse')
"         set mouse=a
"     endif

augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" toggle invisible characters
set list
set listchars=tab:»\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" code folding settings
set foldmethod=syntax " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

if (has("termguicolors"))
    if (!(has("nvim")))
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

" color scheme
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_termcolors=256
colorscheme gruvbox

" Ignore files for completion
set wildignore+=*/.git/*,*/tmp/*,*.swp

" italic comments
highlight Comment cterm=italic gui=italic

""use ctrl-[hjkl] to select the active split!
"nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-j> :wincmd j<CR>
"nmap <silent> <c-h> :wincmd h<CR>
"nmap <silent> <c-l> :wincmd l<CR>

"enable . command in visual mode
vnoremap . :normal.<CR>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" swap and backup options
set noswapfile
set nobackup
set nowb

" persistent undo
if has('persistent_undo')         "check if your vim version supports
    set undodir=~/.config/nvim/undodir      "directory where the undo files will be stored
    set undofile                    "turn on the feature
endif

" disable arrow keys in normal,insert mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>

" Leader
let mapleader=" "
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>V :source $MYVIMRC<CR>
" save session,  After saving a Vim session, you can reopen it with vim -S.
nnoremap <leader>S :mksession<CR>
nmap <silent> // :nohlsearch<CR>
nmap <leader>l : set list!<cr>
nmap <leader>z <Plug>Zoom
" switch between current and last buffer
nmap <leader>. <c-^>
nnoremap <Leader>b :ls<CR>:b<Space>

" ale
let g:ale_linter_explicit=1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=Red
highlight ALEWarningSign ctermbg=NONE ctermfg=Yellow

" airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" gundo
nnoremap <Leader>g :GundoToggle<CR>
let g:gundo_right = 1
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" Compile and Run
autocmd filetype cpp nnoremap <F5> :w <bar> !time g++ -g -ulimit -Wall -Wextra -unused-result -std=c++14  -O2   % -o %:r && ./%:r < ./inp.txt <CR>
autocmd filetype cpp nnoremap <F6> :w <bar> !g++ -ulimit -Wall -unused-result -std=c++14   -O2   % -o %:r && ./%:r <CR>
"autocmd filetype python nnoremap <F5> :w <bar> !python3 % < ./inp.txt <CR>
"autocmd filetype perl nnoremap <F5> :w <bar> !perl % <CR>
"autocmd filetype go nnoremap <F5> :w <bar> !go build % && ./%:r <CR>

autocmd BufNewFile *.cpp 0r ~/.config/nvim/skeleton.cpp " template for cpp file

function! TrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    keep %s/\s\+$//e
    call cursor(l, c)
endfunc
nnoremap <leader>tw :call TrailingWhitespaces()<cr>

let s:compilers = {
            \ "ada"      : "gnat",
            \ "c,cpp"    : "gcc",
            \ "go"       : "go",
            \ "haskell"  : "ghc",
            \ "html"     : "tidy",
            \ "java"     : "javac",
            \ "perl"     : "perl",
            \ "php"      : "php",
            \ "plaintex" : "tex",
            \ "python"   : "pyunit",
            \ "rust"     : "rustc",
            \ "tex"      : "tex",
            \}

let s:makeprgs = {
            \ "ada"      : [ 0, "gnatmake % && gnatclean -c %" ],
            \ "asm"      : [ 0, "as -o %:t:r.o % && ld -s -o %:t:r %:t:r.o && rm %:t:r.o" ],
            \ "basic"    : [ 1, "vintbas %" ],
            \ "c"        : [ 0, "gcc -std=gnu99 -g % -o %:t:r" ],
            \ "cpp"      : [ 0, "g++ -std=gnu++14 -Wall -Wextra -pedantic -std=c++11 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector  -g % -o %:t:r" ],
            \ "go"       : [ 0, "go build" ],
            \ "haskell"  : [ 0, "ghc -o %:t:r %; rm %:t:r.hi %:t:r.o" ],
            \ "html"     : [ 0, "tidy -quiet -errors --gnu-emacs yes %" ],
            \ "java"     : [ 0, "javac -d $TMPDIR/java %:p && jar cvfe %:t:r.jar %:t:r -C $TMPDIR/java ." ],
            \ "lisp"     : [ 1, "clisp %" ],
            \ "lua"      : [ 1, "lua %" ],
            \ "nasm"     : [ 0, "nasm -f elf64 -g % && ld -g -o %:t:r %:t:r.o && rm %:t:r.o" ],
            \ "perl"     : [ 1, "perl %" ],
            \ "plaintex" : [ 0, "xetex -output-directory=$TMPDIR/TeX -interaction=nonstopmode % 1>&2 && mv $TMPDIR/TeX/%:t:r.pdf ./" ],
            \ "python"   : [ 1, "python %" ],
            \ "rust"     : [ 1, "rustc %" ],
            \ "sh"       : [ 1, "chmod +x %:p && %:p" ],
            \ "tex"      : [ 0, "xelatex -output-directory=$TMPDIR/TeX -interaction=nonstopmode % 1>&2 && mv $TMPDIR/TeX/%:t:r.pdf ./" ],
            \ "xhtml"    : [ 0, "tidy -asxhtml -quiet -errors --gnu-emacs yes %" ],
            \}

let s:run_cmds = {
            \ "html"     : [ 1, "$BROWSER %:p" ],
            \ "java"     : [ 0, "java -jar %:t:r.jar" ],
            \ "markdown" : [ 0, "grip --quiet -b %" ],
            \ "plaintex" : [ 2, "zathura %:p:h/%:t:r.pdf" ],
            \ "tex"      : [ 2, "zathura %:p:h/%:t:r.pdf" ],
            \ "xhtml"    : [ 1, "$BROWSER %:p" ],
            \}


for [ft, comp] in items(s:compilers)
    execute "autocmd filetype ".ft." compiler! ".comp
endfor

function! s:Run(file, ...) abort
    let options = ""
    let detach = 0
    if has_key(s:run_cmds, &ft)
        let cmd = s:run_cmds[&ft][1]
        if s:run_cmds[&ft][0] == 1
            let options = "++close "
        elseif s:run_cmds[&ft][0] == 2
            let detach = 1
        endif
    elseif executable("./" . a:file)
        let cmd = "./" . a:file
    elseif has_key(s:makeprgs, &ft) && s:makeprgs[&ft][0]
        let cmd = s:makeprgs[&ft][1]
    else
        echo "I don't know how to execute this file!"
        return
    endif

    let cmd .= " ".get(a:, 1, "")

    if detach
        call system(expandcmd(cmd)." &")
    elseif has('nvim')
        execute "tabe term://".cmd
        if options == "++close "
            autocmd TermClose <buffer> call feedkeys("q")
        endif
    else
        execute "tab term ++shell ".options.cmd
    endif

endfunction

function! s:Build(...) abort
    write

    let interpreter = 0
    if has_key(s:makeprgs, &ft)
        let l:shellpipe_old = &shellpipe
        let &l:shellpipe    = "1>&2 2>"

        let l:makeprg_old = &makeprg
        let &l:makeprg    = "(".s:makeprgs[&ft][1]." ".get(a:, 1, "").")"

        let interpreter = s:makeprgs[&ft][0]

        if interpreter
            make
        else
            silent! make | redraw!
        endif

        let &l:makeprg   = l:makeprg_old
        let &l:shellpipe = l:shellpipe_old
    else
        execute "make %:t:r"
    endif

    return !(v:shell_error || interpreter)
endfunction

function! s:BuildAndRun() abort
    let file = expand('%:t:r') " current file - in case of Vim jumping to other
    if <SID>Build()
        call <SID>Run(file)
    endif
endfunction

command! -nargs=* RunProg     call <SID>Run(expand('%:t:r'), "<args>")
command! -nargs=* Build       call <SID>Build("<args>")
command! -nargs=* BuildAndRun call <SID>BuildAndRun()

nnoremap <F7>  :Build<CR>
nnoremap <F8>  :RunProg<CR>
nnoremap <F9>  :BuildAndRun<CR>
nnoremap <F10> :w <bar> make<CR>

"vim: fen (compile and run) from https://github.com/Jorengarenar/dotfiles/blob/master/vim/plugin/build_and_run.vim
"(config reference) https://github.com/nicknisi/dotfiles/blob/master/config/nvim/init.vim
