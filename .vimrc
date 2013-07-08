function! OnStart()
    normal '0
    tab ball
    tabfirst
endfunction

call pathogen#infect() "pathogen: load plugins
:Helptags "pathogen: generate documentation
set nocompatible
"the order of the following lines until syntax on is crucial for matchit.vim
"see http://stackoverflow.com/q/1440292/813665
so $VIMRUNTIME/macros/matchit.vim
filetype on
filetype plugin indent on
filetype detect
set lisp 
syntax on
" Don't update the display while executing macros
set lazyredraw
" At least let yourself know what mode you're in
set showmode
set incsearch
set history=10000
"set hlsearch "highlight search results
" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu
set ai sw=4 sm si
set tabstop=4
set expandtab
set foldmethod=indent
set viminfo='10,%
nmap <F4> <Leader>be
imap <F4> <Esc><Leader>be
nmap <F5> :wall \| :call Make()<CR>
nmap <F8> :cnext<CR>
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
au BufNewFile,BufRead *.dust set filetype=html
au BufNewFile,BufRead *.coffee set filetype=coffee
au FileType clojure setlocal makeprg=clojure\ %
au FileType coffee setlocal makeprg=coffeelint\ %
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal makeprg=python3\ %
au FileType ruby setl sw=2 sts=2 et
au FileType python setl sw=2 sts=2 et
au BufRead,BufNewFile *.scss set filetype=scss



let g:jsbeautify = {'indent_size': 4, 'indent_char': ' '}
let g:htmlbeautify = {'indent_size': 4, 'indent_char': ' ', 'max_char': 78, 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u']}
let g:cssbeautify = {'indent_size': 4, 'indent_char': ' '}
map <c-f> :call JsBeautify()<cr>


"auto save/load of undo files
"au BufReadPost * call ReadUndo()
"au BufWritePost * call WriteUndo()
"func ReadUndo()
"  if filereadable(expand('%:h'). '/UNDO/' . expand('%:t'))
"    rundo %:h/UNDO/%:t
"  endif
"endfunc
"func WriteUndo()
"  let dirname = expand('%:h') . '/UNDO'
"  if !isdirectory(dirname)
"    call mkdir(dirname)
"  endif
"  wundo %:h/UNDO/%:t
"endfunc
set undodir=~/.vim/UNDO

