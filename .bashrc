# shellcheck disable=SC2148,SC2181,SC1090,SC1091
## ~/.bashrc
## Source global definitions (see also: ~/.inputrc)
## yaswant.pradhan

## my stuff
[ -s /etc/bashrc ] && source /etc/bashrc          # bash completion, etc
[ -s ~/.bash_options ] && source ~/.bash_options  # bash prompt, etc
[ -s ~/.sh_functions ] && source ~/.sh_functions  # shell agnostic functions
[ -s ~/.sh_aliases ] && source ~/.sh_aliases      # aliases

LOAD_BASHIT=${LOAD_BASHIT:-1}

## third-party stuff
# -- quick file completion. Key bindings:
#   <CTRL+F>  find under cursor
[ -s ~/.qfc/bin/qfc.sh ] && source ~/.qfc/bin/qfc.sh

# -- powerful fuzzy finder. Key bindings:
#   <CTRL+T>  initiate fzf
#   <CTRL+R>  search history
#   <ALT+C>   cd to search dir
[ -s ~/.fzf.bash ] && source ~/.fzf.bash


## conda stuff
# -- conda initialization on-demand (don't pollute default user PATH)
conda-init() {
  source ~/.conda/conda-init-bash || echo "W: Conda initialization failed."
}

## command completion with shortcuts
# m for module (enables command completion)
complete -F _module m

