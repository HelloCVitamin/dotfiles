"-----------------------------------------------------------------------------
" VUNDLE
"-----------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/bufkill.vim'
Plugin 'wincent/Command-T'
Plugin 'Raimondi/delimitMate'
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/matchit'
Plugin 'yegappan/mru'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors'
" colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
"-----------------------------------------------------------------------------
" /VUNDLE
"-----------------------------------------------------------------------------

"A lot of the config comes from https://github.com/derekwyatt/vim-config


"set the theme / colorscheme
set background=dark
colorscheme base16-solarized-dark

set encoding=utf-8

"autocompletion pimped
highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey80
set completeopt=menuone,menu,longest,preview

"remove bell and visual bell
"You must also put this line in gvimrc
set vb t_vb=

"move the *.swp and the ~ files
set backupdir=/var/tmp/vim//
set directory=/var/tmp/vim//

"move the view directory (to save folding)
set foldmethod=manual
set viewdir=/var/tmp/vim//

"Latex
let g:tex_flavor='latex'

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Cusor in splitted window
set splitbelow
set splitright

" Split navigation
nnoremap <silent> <M-j> <C-W>j
nnoremap <silent> <M-k> <C-W>k
nnoremap <silent> <M-l> <C-W>l
nnoremap <silent> <M-h> <C-W>h
nnoremap <silent> <M-s> <C-W>s
nnoremap <silent> <M-v> <C-W>v

set autoindent

" Add the unnamed register to the clipboard
" set clipboard+=unnamed

" set the search scan to wrap lines
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash

" Make command line two lines high
set ch=2

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=cesB$

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Cursor stay in position where it was when enter in a buffer
set nostartofline

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
" set guioptions=acm
set guioptions=aci " witout the file bar

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=2000

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu
set wildmode=longest:list,full


" Same as default except that I remove the 'u' option and the tags
set complete=.,w,b
"set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 120 chars
" set textwidth=120

" get rid of the silly characters in window separators
set fillchars=""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Make the current file executable
nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

" next location list error
nmap <silent> ,n :lnext<CR>

" last buffer
nmap <silent> ,bb :b#<CR>

" next buffer
nmap <silent> ,bn :bn<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>

" set text wrapping toggles
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" Map CTRL-E to do what ',' used to do
nnoremap <c-e> ,
vnoremap <c-e> ,

" Buffer commands
noremap <silent> ,bd :BD<CR>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Search the current file for what's currently in the search
" register and display matches
nmap <silent> ,gs
     \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw
     \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW
     \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Command line seach history with c-p et c-n
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"highlight all occurence of current word
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"disable hls on <esc> key
nnoremap <silent> <esc> :noh<return><esc>

"-------------------TAGS------------------------------------
set tags=./tags,tags,/
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
":tn  tp
"ctags c++
"nmap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"ctags java
"nmap <C-F12> :!ctags -R --language-force=java --fields=+iaS --extra=+q .<CR>
"-------------------/TAGS------------------------------------

" Map F5 depending on filetype
" Latex save and compile
autocmd Filetype tex map <buffer> <F5> :w \| Latexmk<CR>

" run the current python script and write stdout and stderr into a named
" pipe /tmp/mypipe in order to display the result with namedpipe.py
" Used for hepia system d'expoitation
" We have to use the custom command silent to properly get rid
" of the "Hit enter to continue"
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'
autocmd Filetype python nmap <silent> ,rs :w \| Silent python2 % &> /tmp/mypipe<CR>




" Remove white spaces on save
autocmd BufWritePre * :%s/\s\+$//e


"-------------------/TAGBAR---------------
nmap <F8> :TagbarToggle<CR>
"-------------------/TAGBAR---------------
"
"-------------------/GUNDO---------------
" nmap <F6> :GundoToggle<CR>
"-------------------/GUNDO---------------

" "-----------------------------------------------------------------------------
" " Omnisharp
" "-----------------------------------------------------------------------------
" "move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
" set splitbelow
" "Showmatch significantly slows down omnicomplete
" ""when the first match contains parentheses.
" set noshowmatch
" nnoremap ,fd :OmniSharpGotoDefinition<cr>
" nnoremap ,fi :OmniSharpFindImplementations<cr>
" nnoremap ,fu :OmniSharpFindUsages<cr>
" nnoremap ,ft :OmniSharpTypeLookup<cr>
" autocmd FileType cs setlocal omnifunc=OmniSharp#Complete


"-----------------------------------------------------------------------------
" EasyMotion Plugin Settings
"-----------------------------------------------------------------------------
" let g:EasyMotion_leader_key = 'é'


"-----------------------------------------------------------------------------
" Vim-airline
"-----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


"-----------------------------------------------------------------------------
" Command-t
"-----------------------------------------------------------------------------
nmap ,t : CommandT<cr>
" nmap ,bt : CommandTBuffer<cr>
nmap ,bt : CommandTMRU<cr>
" do not select git root as command-t base dir when current dir is under git
" (= keep command-t as if there is no git)
let g:CommandTTraverseSCM='pwd'
let g:CommandTMaxFiles=10000
let g:CommandTMaxDepth=15
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxHeight=15
set wildignore+=*.o,*.obj,.git,*.class,.svn

"-----------------------------------------------------------------------------
" JEDI VIM
"-----------------------------------------------------------------------------
let g:jedi#popup_on_dot = 0
let g:jedi#auto_close_doc = 0
let g:jedi#force_py_version = 2

"-----------------------------------------------------------------------------
" Eclim
"-----------------------------------------------------------------------------
"nmap ,jc : JavaCorrect<cr>
"nmap ,jp : ProjectProblems!<cr>

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
map <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
map <S-F7> :NERDTreeClose<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]

"-----------------------------------------------------------------------------
" YouCompleteME
"-----------------------------------------------------------------------------
let g:ycm_auto_trigger = 0

"-----------------------------------------------------------------------------
" FLAKE8
"-----------------------------------------------------------------------------
" " Map Flake8 to F3
" autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
" "Python2
" let g:flake8_cmd="/usr/bin/flake8-python2"
" " Remove max line check
" let g:flake8_max_line_length=500
" " Run flake8 on save
" autocmd BufWritePost *.py call Flake8()
" " Enable McCabe complexity
" let g:flake8_max_complexity=10

"-----------------------------------------------------------------------------
" SYNTASTIC
"-----------------------------------------------------------------------------
"let g:syntastic_python_flake8_args = "--ignore=E501 --max-complexity=10"
let g:syntastic_python_flake8_args = "--ignore=E501"
" let g:syntastic_python_python_exec = '/usr/bin/python2'
" let g:syntastic_python_python_exec = '/usr/bin/python3'

"-----------------------------------------------------------------------------
" DELIMITMATE
"-----------------------------------------------------------------------------
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
inoremap <C-Tab> <C-R>=delimitMate#JumpAny("\<C-Tab>")<CR>
" Ctrl-j to get out of the bracket
imap <C-j> <C-g>g

"-----------------------------------------------------------------------------
" Fix constant spelling mistakes
"-----------------------------------------------------------------------------
iab aevc      avec
iab Aevc      Avec
iab dnas      dans
iab Dnas      Dans
iab tache     tâche
iab taches    tâches
iab meme      même
iab ansi      ainsi
iab Ansi      Ainsi
iab etre      être
iab interet   intérêt
iab Interet   Intérêt
iab grace     grâce
iab Grace     Grâce
iab plutot    plutôt

"-----------------------------------------------------------------------------
" function to automatically fit the quickfix to the nbr of errors
"-----------------------------------------------------------------------------
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
    set lines=100 columns=100
    "font for windows:
    "set guifont=courier_new:h12
    "font for linux:
    set guifont=Monospace
endif
:nohls
