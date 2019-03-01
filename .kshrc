# ~/.kshrc
# User .kshrc file (also /usr/bin/ksh initialization)
# ---------------------------------------------------------------------
#
# This script is run every time the Korn shell is invoked.
# Add lines to this file to define aliases and functions.
# Environment variable definitions are more efficient in your .profile
# If you export a definition, it will also be available to sub-shells.
#
# ---------------------------------------------------------------------

[ -f /etc/kshrc ] && . /etc/kshrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions


if [ $(uname) = "HP-UX" ]; then
  ##  HP-UX specific
  alias ll='ls -lrt'
else
  ##  Linux specific
  ## ksh93 keybind work around
  ## (check ${.sh.version})
  ## note: ksh93h+ maps arrow keys automatically
  ##       ksh93g+ maps tab to 'line completion'
  ##       ksh93d doesn't support KEYBD mapping
  if [ -o interactive ]; then
    set -o emacs
    if [[ "$KSH_VERSION" = *PD\ KSH* ]]; then
      # RHEL4 pdksh
      # Enable auto completion using tab
      bind ^i=complete 2>/dev/null
      bind ^i=complete-list 2>/dev/null
      bind '^[['=prefix-2
      bind '^XA'=up-history
      bind '^XB'=down-history
      bind '^XC'=forward-char
      bind '^XD'=backward-char
    else
      # RHEL6 ksh93 (doesn't have bind, hence using KEYBD trap)
      #trap 'case "${.sh.edchar}" in ("OH") .sh.edchar="";; ("OF") .sh.edchar="";; ("[3~") .sh.edchar="";; esac' KEYBD
      #set -o ignoreeof # disables logout with CTL-D (set +o ignoreof to enable)

      # key bindings - make Home, End, Delete... work
      keybd_trap () {
        case ${.sh.edchar} in
          $'\f')    .sh.edchar=$'\e\f';;  # Ctrl+L = clear-screen
          $'\e[1~') .sh.edchar=$'\001';;  # Home = beginning-of-line
          $'\e[4~') .sh.edchar=$'\005';;  # End = end-of-line
          $'\e[5~') .sh.edchar=$'\e>';;   # PgUp = history-previous
          $'\e[6~') .sh.edchar=$'\e<';;   # PgDn = history-next
          $'\e[3~') .sh.edchar=$'\004';;  # Delete = delete-char
        esac
      }
      trap keybd_trap KEYBD
    fi
  fi
fi



# Compatible with both Linux and HP
if [ -o interactive ]; then
  #set -o noignoreeof
  xr() { eval `resize`; }

  # Multi-line prompt:
  unset _h _m _s
  eval $(date "+_h=%H ;_m=%M ;_s=%S")
  ((SECONDS = 3600*${_h#0}+60*${_m#0}+${_s#0}))
  typeset -Z2 _h _m _s
  _tsub="(_m=(SECONDS/60%60)) == (_h=(SECONDS/3600%24)) + (_s=(SECONDS%60))"
  _timehm='${_x[_tsub]}$_h:${_m}'
  _timehms='${_x[_tsub]}$_h:$_m:${_s}'

  PS_USER=$(whoami)
  PS_HOST=$(hostname)
  PS_NLINE='
'
  PS1=$'\E[47m'$'\E[1;30m'$PS_USER@$PS_HOST:$'\E[45;37m''$PWD'$'\E[0;35m'$PS_NLINE$'\E[33m'$_timehm' '$'\E[0;37m'
fi
