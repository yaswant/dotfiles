## Source rc|pro file ---------------------------------------------------------
alias re='echo Updating user bashrc ..; . ~/.bashrc'
alias rep='echo Updating user profile ..; . ~/.profile'

## Linux kernel, CPU, memory etc.
alias osinfo='cat /etc/system-release ; echo $(uname -n)  [Kernel:$(uname -r)]  [OS:$(uname -o)]  [Proc:$(uname -p)]'
alias last-update='rpm -q kernel --last'
alias proc='pidstat -r |sort -k7r'
alias cpu="grep 'model name' /proc/cpuinfo"
alias mem="grep 'MemTotal' /proc/meminfo"

## Show system and Library paths
alias path='echo -e ${PATH//:/\\n} |sort'
alias lpath='echo -e ${LD_LIBRARY_PATH//:/\\n} |sort'
alias libpath=lpath


## xterm setting
alias xterm='xrdb -merge ~/.Xresources && xterm'

## Replace hexadecimal symbols (%XX, in URLs) to equivalent character; e.g.
## echo "web.addre.ss/My%20Page" | urldecode
#/ will replace %20 with blank space
alias urldecode='sed "s@+@ @g;s@%@\\\\x@g" |xargs -0 printf "%b"'

## Archive stuff
alias archive='rsync -aiuvzP'
alias archive-all='rsync -aiuvzKLP'     # pull content from symbolic links too

alias markdown='~/bin/Markdown.pl'
alias crontab='crontab -i'
alias e='/usr//bin/nano'
alias f='find $@ 2>/dev/null'
alias h='history | less'

## Quick switch path
alias -- -="cd -"                       # toggle cd with -
alias ..='cd ..'                        # cd 1 level above
alias ...='cd ../..'                    # cd 2 level above
alias ....='cd ../../..'                # cd 3 level above
alias rs='eval $(resize)'               # pass window size to shell

alias less='LESS_IS_MORE=1 less'
alias le=less

## Listing
alias l='ls --group-dir'			    # short list
alias lb='ls -bgo'						# long list, no group/owner
alias lh='clear; ls -lhFo'
alias lm='l |more'                      # short list and paginate
alias la='ls -AF --group-dir'           # list almost all
alias lll='ls --g -lA'
### sort
alias ll='ls -FGghrt'                   # sort by time
alias lx='ls -X --group-dir'            # sort by ext
alias llx='ls -FghoX'                   # sort by ext
alias lt='ls -rto --group-dir'          # sort by mod time
### type
alias lsk="ls -lGg --block-size=1000000000 --time-style=long-iso |grep ^l |cut -d' ' -f7-"
alias llk='ll |egrep ^l #"ell"'         # long list linked files
alias lsf="ls -l |grep -v '^d' |ls"     # list files only
alias llf="ll |grep -v ^d |grep -v ^l"  # long list files only
alias lsd='ls -d */'                    # list directories only
alias lld="ll |grep ^d"                 # long list directories only
alias lsd1='ls -d */ |cut -d/ -f1'      # 1 column, without / mark

alias lss='ls -ghoFS'                   # list files size-sorted
alias lls='ls -ghorFS'
alias llt='ls -gohStrF --time-style=long-iso'

alias rmr='rm -r'
alias rmbib='rm *.bib *.ris'
alias c='clear'
alias cl='clear; ls -shX'
alias cls='clear; ls'
alias p='pwd'
alias gz='gzip'
alias pz='pigz'
alias ff='/usr/bin/firefox'
alias fs='/usr/bin/firefox -safe-mode'
alias g='gvim'
alias pdc='pdfcompress2'

### Disk usage
alias qdu='jdiskreport &'
alias dr='jdiskreport &'
alias xdu='baobab &'

alias snapshots='ls -ldut ~/.snapshot/*.?'
alias fonts='identify -list font'
alias colors='identify -list Color'
alias xo=xdg-open
alias go=gnome-open

### ps2pdf default behaviour:
alias ps2pdf='ps2pdf -dMaxSubsetPct=100 -dCompatibilityLevel=1.3 '\
'-dSubsetFonts=true -dEmbedAllFonts=true -dAutoFilterColorImages=false '\
'-dAutoFilterGrayImages=false -dColorImageFilter=/FlateEncode '\
'-dGrayImageFilter=/FlateEncode -dMonoImageFilter=/FlateEncode -sPAPERSIZE=a4'


### Spice:
#### show spice jobs in queue (short and long)
#### spice interactive
alias sq="squeue -u $USER"
alias sql="squeue -u $USER -o '%.7i %.40j %.5u %.8T %.5M %.8l %.6D %.6P %R'"
alias spi='salloc -t 360 --mincpus=4 --cpu-freq=Performance --mem=8G'

### Exclude .svn .pyc files while archiving
alias rsyncs="rsync -a --exclude=.svn --exclude=*.pyc --checksum"

