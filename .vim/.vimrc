runtime bundle/vim-pathogen/autoload/pathogen.vim

"set background=dark

" use pathogen to manage plugins
" https://github.com/tpope/vim-pathogen
call pathogen#infect()

"change mapleader, default is '\'
let mapleader=","

"set spell check on by default
"set spell
"toggle spell check
nmap <silent> <leader>s :set spell!<CR>

"set clipboard=unamed

set wildmenu
set hidden "turn off file not saved warning

set autochdir "change dir based on current file

filetype indent on
syntax enable
set number
set hlsearch
set incsearch
set ignorecase
" make lines past 80 chars noticable.
" set colorcolumn=80 " puts one ugly line down pages
" set textwidth=80

" below looks better, only highlights part that goes over
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%>80v.\+/

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap

nnoremap <tab> %
vnoremap <tab> %

set smarttab
autocmd FileType make setlocal noexpandtab
map <F2> :w\|!python %
filetype plugin on
set ofu=syntaxcomplete#Complete


"map <F4> :TlistToggle<cr>
map <F8> :!/opt/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

let TList_Ctags_Cmd='/opt/local/bin/ctags'
nnoremap <silent> <F3> :TlistToggle<CR>
nnoremap <F5> :GundoToggle<CR>

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

" Use split explorer model.  i.e. :e .
let NERDTreeHijackNetrw=1

"Show current file in NERDTree
noremap <leader>N :NERDTreeFind<CR>

"settings for undo added in vim 7.3
set undodir=~/.dotfiles/.vim/undodir
set undofile
set undolevels=1000  "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"map keys
inoremap jj <Esc>

"unmap the arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"over ride mapping for tasklist, defaults to <leader>t
"map <leader>l <Plug>tasklist
"done in tasklist to prevent startup errors

"mappings for tabs
map <leader>n :tabNext<cr>
map <leader>p :tabprevious<cr>
map <leader>t :tabnew<cr>

"mapping for splitting windows
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

"mappings for moving windows
nnoremap <silent> H <C-w>h
nnoremap <silent> J <C-w>j
nnoremap <silent> K <C-w>k
nnoremap <silent> L <C-w>l

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Make the current file executable
nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

" Digraphs
" Alpha
imap <c-l><c-a> <c-k>a*
" Beta
imap <c-l><c-b> <c-k>b*
" Gamma
imap <c-l><c-g> <c-k>g*
" Delta
imap <c-l><c-d> <c-k>d*
" Epslion
imap <c-l><c-e> <c-k>e*
" Lambda
imap <c-l><c-l> <c-k>l*
" Eta
imap <c-l><c-y> <c-k>y*
" Theta
imap <c-l><c-h> <c-k>h*
" Mu
imap <c-l><c-m> <c-k>m*
" Rho
imap <c-l><c-r> <c-k>r*
" Pi
imap <c-l><c-p> <c-k>p*
" Phi
imap <c-l><c-f> <c-k>f*

let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
if has("mac") 
  set gfn=Menlo:h12
  set shell=/bin/bash
elseif has("win32")
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif has("linux")
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif

if &t_Co >= 256 || has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme peaksea
"  colorscheme obsidian2
  set nonu
else
  colorscheme zellner
  set nonu
endif

set encoding=utf8
try
  lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/jeff/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
if has("mac") 
    set grepprg=/usr/bin/grep\ -nH
else
    set grepprg=/bin/grep\ -nH
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Highlight whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" toggle whitespace highlight
nmap <silent> ,w :set list!<CR>

" Paste toggle, prevent auto indenting when pasting
set pastetoggle=<F11>

" Clear highlighted search terms
nmap <silent> ,/ :nohlsearch<CR>

" Oh snap!  Forgot to use sudo to edit this file
cmap w!! w !sudo tee % >/dev/null

" turn on line numbers
" set number
" use relative line numbers instead
set relativenumber

au FocusLost * :wa

nnoremap <leader>a :Ack
"nnoremap <leader>c<space>

""" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sessions
"
" use: gvim --servername dev
"
" where do you want to save sessions?
let g:session_dir = $HOME."/.vimsessions"

" Save sessions whenever vim closes
autocmd VimLeave * call SaveSession()

" Saves the session to session dir. Creates session dir if it doesn't
" yet exist. Sessions are named after servername paameter
function! SaveSession()

    " get the server (session) name
    let s = v:servername

    " create session dir if needed
    if !isdirectory(g:session_dir)
        call mkdir(g:session_dir, "p")
    endif

    " save session using the server name
    execute "mksession! ".g:session_dir."/".s.".session.vim"
endfunc

" Load session when vim is opened
autocmd VimEnter * nested call OpenSession()
 
" Open a saved session if there were no file-names passed as arguments
" The session opened is based on servername (session name). If there
" is no session for this server, none will be opened
function! OpenSession()

    " check if file names were passed as arguments
    if argc() == 0

        let sn = v:servername
        let file = g:session_dir."/".sn.".session.vim"

        " if session file exists, load it
        if filereadable(file)
            execute "source ".file
        endif
    endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Templates
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile  *.h   0r ~/dev/vim-templates/header.h
autocmd BufNewFile  *.cpp   0r ~/dev/vim-templates/cppfile.cpp
