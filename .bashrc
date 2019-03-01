# .bashrc
# Source global definitions (see also: ~/.inputrc)

# Load defaults
[ -f /etc/bashrc ] && . /etc/bashrc

LOAD_BASHIT=${LOAD_BASHIT:-1}

# Custom options
if (( "$LOAD_BASHIT" )); then
  [ -f ~/.bashitrc ] && . ~/.bashitrc
fi
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_options ] && . ~/.bash_options
[ -f ~/.bash_functions ] && . ~/.bash_functions
[ -f ~/bin/z.sh ] && . ~/bin/z.sh
