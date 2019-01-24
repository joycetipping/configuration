# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Define two very important variables
export home="$HOME"
export conf="$home/projects/configuration"

# Adjust the path
[[ -d "$home/bin" ]] && PATH="$PATH:$home/bin"  # Include user's private bin

# Terminal settings
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
export TERM='xterm-256color'

# Bash history
HISTCONTROL=ignoredups:ignorespace  # Don't put duplicate lines in the history.
shopt -s histappend                 # Append to the history file, don't overwrite it
HISTSIZE=
HISTFILESIZE=

# Source Spencer's bash prompt
[[ -d ~/.bash ]] || git clone git@github.com:joycetipping/dotbash.git "$home/.bash"
source "$home/.bash/init"

# Mac specific settings
if [[ "$(uname)" == 'Darwin' ]]; then
  # Source gnu utils and their manpages
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

  # Display broken symlinks. Needs to go after the Mac includes because it requires the gnu coreutils.
  eval $(echo 'ORPHAN 40;1;31' | dircolors)
fi

# Aliases {{{

# Navigation
alias l='ls -CF'
alias la="ls -a"
alias ll="ls -ilh"
alias ls="ls --color=auto"
alias s="ls"
alias u="cd ../"
alias u2="cd ../../"
alias u3="cd ../../../"
alias u4="cd ../../../../"
alias u5="cd ../../../../../"
alias u6="cd ../../../../../../"
alias u7="cd ../../../../../../../"
alias u8="cd ../../../../../../../../"

# Places
alias adam="cd $home/lib/adam/computer"
alias blog="cd $home/projects/blog/"
alias conf="cd $conf"
alias diary="cd $home/projects/life/diary/"
alias dreams="vim $home/projects/life/dreams/$(date '+%Y').txt"
alias foobar="cd $home/projects/company/"
alias journal="cd $home/projects/life/journal/"
alias notes="cd $home/projects/notes/"
alias projects="cd $home/projects/"
alias safe="cd $home/projects/safe/"
alias website="cd $home/projects/joycetipping.com/"

# Home
alias ev0="curl http://192.168.0.34:8180/0"  # turn evaporative off
alias evf="curl http://192.168.0.34:8180/4"  # turn evaporative to fan
alias evc="curl http://192.168.0.34:8180/5"  # turn evaporative to cool

# Date and time
alias d="date"
alias now="date '+%A %-d %B %Y %H:%M:%S %Z'"

# Other
alias audio='rec -r 48k -b 32 ~/media/audio/sox/`date +%Y.%m%d.%H%M%S`.ogg'
alias bc="echo Starting bc -l;echo;bc -l"
alias grep="grep --color"
alias pyserver='python -m SimpleHTTPServer 8080'
alias sus='sudo pm-suspend'
alias sizes='du -sh | sort -h'

# }}}

# Programs {{{

# BC
# --
export BC_ENV_ARGS="$home/.bcrc"


# Exiftool
# --------
dates () {
  # Print all EXIF date fields
  for var in "$@";
  do
    echo "$var"
    exiftool "$var" | grep -i 'date'
    echo
  done
}


# R
# -
export R_LIBS="$home/.R:$R_LIBS"


# Ruby
# ----
function rubyserver {
  port="${1:-3000}"
  ruby -run -e httpd . -p $port
}


# Miscellaneous
# -------------
count () {
  # Count the number of files in the given directories
  if [[ "$#" == "0" ]]
  then
    ls | wc -l
  else
    for var in "$@";
    do
      ls "$var" | wc -l
    done
  fi
}

csum () {
  # Sum the number of files in the given directories
  count "$@" | awk '{s+=$1} END {print s}'
}

# }}}
