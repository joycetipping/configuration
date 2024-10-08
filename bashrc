# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Adjust the path
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"  # Include user's private bin

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
alias asqi="cd $HOME/projects/caterwaullabs/asqi/"
alias blog="cd $HOME/projects/blog/"
alias conf="cd $HOME/projects/configuration/"
alias diary="cd $HOME/projects/life/diary/"
alias dreams="vim $HOME/projects/life/dreams/$(date '+%Y').txt"
alias foobar="cd $HOME/projects/company/"
alias health="cd $HOME/projects/health/"
alias journal="cd $HOME/projects/life/journal/"
alias notes="cd $HOME/projects/notes/"
alias projects="cd $HOME/projects/"
alias play="cd $HOME/projects/playground/"
alias safe="cd $HOME/projects/safe/"
alias website="cd $HOME/projects/joycetipping.com/"

# Emacs
alias em="emacs -nw"
alias en="emacsclient -nw"

# Home
alias ev0="curl http://192.168.0.34:8180/0"  # turn evaporative off
alias evf="curl http://192.168.0.34:8180/4"  # turn evaporative to fan
alias evc="curl http://192.168.0.34:8180/5"  # turn evaporative to cool

# Date and time
alias cal="ncal -C"
alias d="date"
alias now="date '+%A %-d %B %Y %H:%M:%S %Z'"

# Marriage
alias whatthehellspencer="sshuttle -r ubuntu@dev.spencertipping.com --exclude 10.0.0.0/8 0/0"

# Kids
alias adam="ssh adam@adam 'ffmpeg -r 5 -f x11grab -s 1366x768 -i :0.0 -b:v 4000k -f flv -' | ffplay -"
alias baby="ssh gadget 'arecord -f cd -t raw' | play -e signed-integer -b 16 -L -c 2 -r 44100 -t raw - compand .01,.01 -inf,-40,-inf,-40,-40 0 -90 .1"
alias kidsroom="ssh iridium 'arecord -f cd -t wav' | play -t wav - compand .01,.01 -inf,-40,-inf,-40,-40 0 -90 .1"

# Firejail
alias facebook="firejail --disable-mnt --private=/home/joyce/facebook --private-tmp --nodbus google-chrome"
alias tiktok="firejail --disable-mnt --private=/home/joyce/tiktok --private-tmp --nodbus google-chrome"
alias weibo="firejail --disable-mnt --private=/home/joyce/weibo --private-tmp --nodbus firefox"
alias noclick="xinput set-prop 11 'libinput Tapping Enabled' 0"
alias yesclick="xinput set-prop 11 'libinput Tapping Enabled' 1"

# VLC
alias stopchrome="pkill -STOP chrome"
alias startchrome="pkill -CONT chrome"

# Other
alias bc="echo Starting bc -l;echo;bc -l"
alias ghci="stack ghci"
alias grep="grep --color"
alias pyserver='python -m SimpleHTTPServer 8080'
alias sus='sudo systemctl suspend'
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

  ffmpeg -t $duration -i $infile -c copy $outfile
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


# Haskell Stack
# -------------
PATH="$PATH:$HOME/.local/bin"

# }}}


unset GDK_SCALE
unset QT_SCALE_FACTOR
