set autoindent autowrite showmatch wrapmargin=0 report=1
set number
syntax enable
"colorscheme slate
"colorscheme solarized
if has('gui_running')
"    set background=light	" dark
	colorscheme default  "desert
	set guifont=Fira\ Mono\ for\ Powerline
else
"    set background=dark 	" light
	colorscheme slate 		" solarized adrian
endif
set ts=4			" tab spaces
"set shiftwidth=4	" how many spaces back I go when doing a backtab
"map     :set wrapmargin=8
map     {!}sort -b
map  h  1G
map  H  1G
map  F  G
map  V  
map  U  
map  T  k
map  S  j
map  Q   i
map  P   x
map  L   O
map  M   dd
map  K   D
map  J   DjdG$
map! A  ka
map! D  ha
map! C  la
map! B  ja
map! L  
map! Q  
map! R  

augroup filetype
  au! BufRead,BufnewFile rose-*.conf,rose-*.info set filetype=rose-conf
augroup END

augroup filetype
  au! BufRead,BufnewFile *suite*.rc   set filetype=cylc
augroup END

if has("folding") | set foldlevelstart=99 | endif

