function! OnStart()
    normal '0
    tab ball
    tabfirst
endfunction

call pathogen#infect() "pathogen: load plugins
:Helptags "pathogen: generate documentation
syntax on
filetype on
syntax on
filetype plugin indent on
set incsearch
set history=100
"set hlsearch "highlight search results
set ai sw=4 sm si
set tabstop=4
set expandtab
set foldmethod=indent
set viminfo='10,%
nmap <F4> <Leader>be
imap <F4> <Esc><Leader>be
nmap <F5> :wall \| :call Make()<CR>
imap <F5><Esc> :wall \| :call Make()<CR>
nmap <F6> :wall \| :!clojure %<CR>
imap <F6><Esc> :wall \| :!clojure %<CR>
" tab navigation 
nmap <F2> :tabprevious<cr> 
nmap <F3> :tabnext<cr> 
imap <F2> <Esc>:tabprevious<cr> 
imap <F3> <Esc>:tabnext<cr> 
nmap <C-n> :tabnew<cr> 
imap <C-n> <ESC>:tabnew<cr>
nmap <C-x> :tabclose<cr> 

set exrc "enable per-directory .vimrc files
set secure "disable unsafe commands in local .vimrc files

nmap ff :e **/<cfile><CR> 
nmap rr :grep <cword> -w<CR>:copen<CR>
set pastetoggle=<F10> "use \pp to toggle between paste and nopaste
nmap <F10> <F10>i
"set pastetoggle=<Leader>pp "use \pp to toggle between paste and nopaste
set laststatus=2
"use tab for completion
inoremap <tab> <c-p>

set grepprg=prjgrep\ $*\ dev/null
" use ; to enter command window
nmap ; q:
function! Make()
    make
    copen
endfunction
"Here are some settings for diff mode
if &diff
  set diffopt=iwhite "ignore white spaces in diff
"<Ctrl-c> Close all windows
  nmap <C-c> :qall<CR>
"display current line in the command window
  set updatetime=500
  au CursorHold * echo PrintLine()
  set cmdheight=2
"fix the colors 

  set diffopt=filler,iwhite,icase,context:6
  ":windo! set wrap
  " hi diffchange ctermbg=0 .. is black on unix
  hi diffchange term=NONE ctermbg=3 ctermfg=5
  hi diffdelete term=NONE ctermbg=0
  hi diffadd term=NONE ctermbg=1 ctermfg=15
  if $TERM =~ "xterm"
    hi diffchange ctermbg=8 ctermfg=1
    hi difftext ctermbg=8 ctermfg=7
    hi diffadd ctermbg=8 ctermfg=11
  endif
endif
"javascript folding support
function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

let vimclojure#ParenRainbow=1
au BufNewFile,BufRead *.clj set filetype=clojure
au FileType clojure setlocal makeprg=clojure\ %
