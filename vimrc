syntax enable
colorscheme kdevelophi
map <c-o> :cd %:p:h <cr>:tabe %:p:h<cr>
map <s-o> :cd %:p:h <cr>:vsplit<cr><c-w><c-w>:edit .<cr>
map <F5> :call BuildGitRepo()<cr>
map <F6> :call GitDiff()<cr>
map <F8> :tabn<cr>
map <F7> :tabp<cr>
map s :w<cr>
map z : :u<cr>
map <c-z> <c-r><cr>
imap <tab> <c-t>
map q :q<cr>
inoremap { {<cr><cr>}<UP>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

"Add clipboard support.
set clipboard=unnamed
set clipboard=unnamedplus

"Map the y and p to the "standard" shortcuts
"If this doesn't work, look below

map <c-c> "+yi
map <c-v> "+pi

"copy and paste while editing
imap <c-c> <Esc><c-c>i
imap <c-v> <Esc><c-v>i

"The above code works only with vim versions
"that are build with the xterm-clipboard.
"
"vim --version | grep xterm-clipboard
"for more information
"You can override that issue with gvim -v
"or you could create the following alias
"if [ -e /usr/bin/gvim ]; then alias vim='/usr/bin/gvim -v'; fi

"make mouse to work just like in an IDE
set mouse=a

"Make Vim completion popup menu work just like in an IDE
set completeopt=longest,menuone

"show the line numbers
set number
"highlight tab
set list listchars=tab:→\ ,trail:·

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %t%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Column:\ %c

" Delete trailing whitespace on save
func! DeleteTrailingWS()
    %s/\s\+$//ge
endfunc

autocmd BufWrite * :call DeleteTrailingWS()

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set completeopt=menuone
filetype plugin indent on

function! BuildGitRepo()
    :cd %:p:h

    let rootPathRepo = system('git rev-parse --show-toplevel')
    let buildDirectory = substitute(rootPathRepo, "kdesrc", "kdesrc/build")

    exe 'cd' rootPathRepo
    if (isdirectory("build"))
        cd build
    else
        exe 'cd' buildDirectory
    endif

    :!make -j5 install
endfunction

function! GitDiff()
        :cd %:p:h
        :!git diff
endfunction
