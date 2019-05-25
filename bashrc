# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Adjust the path
[[ -d "$HOME/bin" ]] && PATH="$PATH:$HOME/bin"  # Include user's private bin

# Terminal settings
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
export TERM='xterm-256color'

# Load dotbash
[[ -d ~/.bash ]] || git clone git@github.com:joycetipping/dotbash.git "$HOME/.bash"
source "$HOME/.bash/init"

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
alias adam="cd $HOME/lib/adam/computer"
alias blog="cd $HOME/projects/blog/"
alias conf="cd $HOME/projects/configuration/"
alias diary="cd $HOME/projects/life/diary/"
alias dreams="vim $HOME/projects/life/dreams/$(date '+%Y').txt"
alias foobar="cd $HOME/projects/company/"
alias journal="cd $HOME/projects/life/journal/"
alias notes="cd $HOME/projects/notes/"
alias projects="cd $HOME/projects/"
alias safe="cd $HOME/projects/safe/"
alias website="cd $HOME/projects/joycetipping.com/"

# Home
alias ev0="curl http://192.168.0.34:8180/0"  # turn evaporative off
alias evf="curl http://192.168.0.34:8180/4"  # turn evaporative to fan
alias evc="curl http://192.168.0.34:8180/5"  # turn evaporative to cool

# Date and time
alias d="date"
alias now="date '+%A %-d %B %Y %H:%M:%S %Z'"

# Other
alias baby="ssh iridium 'arecord -f cd -t wav' | play -t wav - compand .01,.01 -inf,-40,-inf,-40,-40 0 -90 .1"
alias bc="echo Starting bc -l;echo;bc -l"
alias grep="grep --color"
alias pyserver='python -m SimpleHTTPServer 8080'
alias sus='sudo pm-suspend'
alias sizes='du -sh | sort -h'

# }}}

# Functions {{{

audio () {
  #arecord -f cd -t raw | oggenc - -r -o ~/media/audio/arecord/`date +%Y.%m%d.%H%M%S`.ogg
  rec -r 48k -b 32 ~/media/audio/sox/`date +%Y.%m%d.%H%M%S`.ogg
}

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

howlong () {
  # Display the length of an audio file
  ls $@ | xargs -I % bash -c 'echo -n %; ffprobe -i % 2>&1 | grep Duration'
}

sshplay () {
  cat $1 | ssh $2 '/usr/local/bin/play -'
}

fftruncate () {
  duration=$1
  infile=$2

  filename=$(basename infile)
  extension=${infile##*.}
  outfile=${3:-tmp.$extension}

  ffmpeg -t $duration -i $infile $outfile
}

# }}}

# Programs {{{

# BC
# --
export BC_ENV_ARGS="$HOME/.bcrc"


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
export R_LIBS="$HOME/.R:$R_LIBS"


# Ruby
# ----
function rubyserver {
  port="${1:-3000}"
  ruby -run -e httpd . -p $port
}

# }}}
