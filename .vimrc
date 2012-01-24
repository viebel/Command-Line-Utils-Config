function! OnStart()
    normal '0
    tab ball
    tabfirst
endfunction

call pathogen#infect()
syntax on
set incsearch
set scrolloff=5 " alway show the last 5 lines of the file
set history=100
"set hlsearch "highlight search results
set ai sw=4 sm si
set tabstop=4
set expandtab
set viminfo='10,%
nmap <F4> <Leader>be
imap <F4> <Esc><Leader>be
nmap <F5> :wall \| :call Make()<CR>
" tab navigation 
nmap <F2> :tabprevious<cr> 
nmap <F3> :tabnext<cr> 
imap <F2> <Esc>:tabprevious<cr> 
imap <F3> <Esc>:tabnext<cr> 
nmap <C-n> :tabnew<cr> 
imap <C-n> <ESC>:tabnew<cr>
nmap <C-x> :tabclose<cr> 


nmap ff :e **/<cfile><CR> 
nmap rr :grep <cword> -w<CR>:copen<CR>
set pastetoggle=<F10> "use \pp to toggle between paste and nopaste
nmap <F10> <F10>i
"set pastetoggle=<Leader>pp "use \pp to toggle between paste and nopaste
set laststatus=2
set grepprg=prjgrep\ $*\ dev/null
filetype on
" use ; to enter command window
nmap ; q:
function! Make()
    make
    copen
endfunction
function! InsertTabWrapper() 
    let col = col('.') - 1 
    if !col || getline('.')[col - 1] !~ '\k' 
	return "\<tab>" 
    else 
	return "\<c-p>" 
    endif 
endfunction 
"use tab for completion
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"When jumping on a tag, automatically split the window if the current buffer has been modified
fun! SPLITAG() range 
        let oldfile=expand("%:p") 
        if &modified 
                split 
        endif 
        exe "tag ". expand("<cword>") 
        let curfile=expand("%:p") 
        if curfile == oldfile 
                let pos=getpos(".") 

                if &modified 
              " if we have splitted before: 
                        quit 
                endif 
                call setpos('.', pos) 
        endif 
endfun   
fun! SplitIfBufferModified()
    "if &modified 
        only
        split 
    "endif 
endfun
"When you want to jump to a definition of a variable, 
"what do you do? 
"Use C-] or gd? 
"C-] finds only global variables (and functions. Ctags extracts 
"only global objects). 
"On the other hand, gd detects only local variables. 
"I think it's a bit complicated to choice them by a situation. 
"So I wrote this function: 
"nmap <C-]> :call GoDefinition()<CR>         
"nmap <C-]>   :call SPLITAG()<CR>.
function! GoDefinitionLocalThenGlobal() 
  let pos = getpos(".") 
  normal! gd 
  if getpos(".") == pos 
    exe "call SplitIfBufferModified()"
    exe "tag /" . expand("<cword>") 
  endif 
endfunction 

nmap <C-]> :call GoDefinitionLocalThenGlobal()<CR>         

  "This is a function to show what C/C++ function/struct/class the cursor is in.
  function! GetProtoLine()
    let ret       = ""
    let line_save = line(".")
    let col_save  = col(".")
    let top       = line_save - winline() + 1
    let so_save = &so
    let &so = 0
    let istypedef = 0
    " find closing brace
    let closing_lnum = search('^}','cW')
    if closing_lnum > 0
      if getline(line(".")) =~ '\w\s*;\s*$'
        let istypedef = 1
        let closingline = getline(".")
      endif
      " go to the opening brace
      normal! %
      " if the start position is between the two braces
      if line(".") <= line_save
        if istypedef
          let ret = matchstr(closingline, '\w\+\s*;')
        else
          " find a line contains function name
      let lnum = search('^\w','bcnW')
          if lnum > 0
            let ret = getline(lnum)
          endif
        endif
      endif
    endif
    " restore position and screen line
    exe "normal! " . top . "Gz\<CR>"
    call cursor(line_save, col_save)
    let &so = so_save
    return ret
  endfunction
  function! WhatFunction()
    if &ft != "c" && &ft != "cpp"
      return ""
    endif
    let proto = GetProtoLine()
    if proto == ""
      return "?"
    endif
    if stridx(proto, '(') > 0
      let ret = proto "matchstr(proto, '\w\+(\@=')
    elseif proto =~# '\<struct\>'
      let ret = matchstr(proto, 'struct\s\+\w\+')
    elseif proto =~# '\<class\>'
      let ret = matchstr(proto, 'class\s\+\w\+')
    else
      let ret = strpart(proto, 0, 15) . "..."
    endif
    return ret
  endfunction
  " call WhatFunction in the statusline
"  set statusline=%{WhatFunction()}\ %m%=\ %l-%v\ %p%%\ %02B
" map \ff to display function name
nmap <Leader>ff :echo WhatFunction()<CR>
function! PrintLine()
    let ret = getline(".")
    return ret
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

