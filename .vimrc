" enable AutoSave on Vim startup
let g:auto_save = 1
let g:auto_save_in_insert_mode = 1

set autoindent autowrite showmatch wrapmargin=0 report=1 number cursorline
syntax enable
if has('gui_running')
    "set background=light	" dark
	"colorscheme default
	set lines=50 columns=90
	set guifont=Fira\ Mono
else
	colorscheme pablo "slate "solarized adrian
endif
set ts=4			" tab spaces
set shiftwidth=4	" how many spaces back I go when doing a backtab
set expandtab       " tabs are expanded to spaces

" Visible formatting markers
set ffs=unix        " display CR (^M)
set encoding=utf-8
set fileencoding=utf-8
set listchars=eol:¶ " show end-of-line character
"set list

" To include ctrl chars, INS mode Ctrl+V, followed by Ctrl+<key> of Alt+<key>
"  = Ctrl+x
" x = Alt+x
"
map     :set wrapmargin=4
map     {!}sort -b
map  dd
"map  h  1G
"map  H  1G
"map  F  G
"map  V  
"map  U  
"map  T  k
"map  S  j
"map  Q   i
"map  P   x
"map  L   O
"map  P
"map  K   D
"map  J   DjdG$
"map! A  ka
"map! D  ha
"map! C  la
"map! B  ja
"map! L
"map! Q  
"map! R  

" Rose/Cylc
augroup filetype
  au! BufRead,BufnewFile rose-*.conf,rose-*.info set filetype=rose-conf
augroup END
augroup filetype
  au! BufRead,BufnewFile *suite*.rc   set filetype=cylc
augroup END

if has("folding") | set foldlevelstart=99 | endif

" Highlights
" 1. Current line under cursor
hi LineNr ctermfg=2 ctermbg=0 guifg=Grey guibg=Grey90
hi cursorline cterm=none term=none ctermbg=0 ctermfg=white
" 2. SpellCheck style for [g]Vim
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red
hi SpellBad gui=undercurl guifg=red


" Toggles (note: <Leader> is mapped to \ key on the keyboard)
map <F6> :setlocal spell! spelllang=en_gb<CR>   " SpellCheck
map <F12> :setlocal nu!<CR>                     " LineNumber
:nnoremap <Leader>c :set cursorline!<CR>        " highlight line
nnoremap <F3> :set list!<CR>                    " display unprintable characters


