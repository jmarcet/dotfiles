export EDITOR='vim'
export PAGER='less'
export VISUAL='vim'

export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:$MANPATH"

export TMUXIFIER_LAYOUT_PATH=$HOME/.tmux-layouts
[ -e $TMUXIFIER_LAYOUT_PATH ] || mkdir $TMUXIFIER_LAYOUT_PATH

[[ "$TERM" == *"-256color" ]] || export TERM="xterm-256color"

umask 002
unset GREP_OPTIONS

if [ -s $HOME/.tmuxifier/init.sh ]; then
    source $HOME/.tmuxifier/init.sh
    export PATH=$HOME/.tmuxifier/bin:$PATH
fi

if [ -f /etc/arch-release ]; then
    [ $UID -ne 0 ] && systemctl --user import-environment PATH
    source /usr/share/doc/find-the-command/ftc.zsh quiet

    # export ARCHFLAGS="-arch x86_64"
    export BROWSER=firefox
    [[ "${TERM_PROGRAM}" == "vscode" ]] && export BROWSER=microsoft-edge-beta
    export CCACHE_DIR=$HOME/.ccache
    # export CFLAGS="-march=native -g -ggdb3 -O0 -pipe -combine -Wall -pedantic"
    # export CXXFLAGS="-march=native -g -ggdb3 -O0 -pipe -combine -Wall -pedantic"
    # export CC=gcc
    # export CFLAGS="-march=corei7-avx -mavx -pipe -g -O2"
    # export CXXFLAGS="-march=corei7-avx -mavx -pipe -g -O2"
    # export CONCURRENCY_LEVEL=$(( `getconf _NPROCESSORS_ONLN` + 1 ))
    # export DEB_CFLAGS="-g -ggdb -O0 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Wformat-security"
    # export DEB_CXXFLAGS="-g -ggdb -O0 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Wformat-security"
    # export DEB_BUILD_OPTIONS=nostrip
    # export DH_VERBOSE=1
    export USE_CCACHE=1

    export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

elif [ -e /etc/openwrt_release ]; then
    export FZF_BASE=/usr/local/share/fzf

elif [[ "$OSTYPE" == darwin* ]]; then
    export BROWSER=open

fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/bin
  $HOME/.local/bin
  $HOME/.config/yarn/global/node_modules/.bin
  $HOME/.gem/ruby/3.0.0/bin
  $HOME/go/bin
  /opt/android-sdk/platform-tools
  /usr/local/{bin,sbin}
  $path
  /sbin
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
    export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# History options
#

alias history="history 1"

HISTFILE=$HOME/.histfile
HISTSIZE=5000
SAVEHIST=5000

BANG_HIST=1                 # treats the **!** character specially during expansion.
EXTENDED_HISTORY=1          # writes the history file in the *:start:elapsed;command* format.
HIST_EXPIRE_DUPS_FIRST=1    # expires a duplicate event first when trimming history.
HIST_IGNORE_DUPS=1          # does not record an event that was just recorded again.
HIST_IGNORE_ALL_DUPS=1      # deletes an old recorded event if a new event is a duplicate.
HIST_FIND_NO_DUPS=1         # does not display a previously found event.
HIST_IGNORE_SPACE=1         # does not record an event starting with a space.
HIST_SAVE_NO_DUPS=1         # does not write a duplicate event to the history file.
HIST_VERIFY=1               # does not execute immediately upon history expansion.
HIST_BEEP=1                 # beeps when accessing non-existent history.
INC_APPEND_HISTORY=1        # writes to the history file immediately, not when the shell exits.
SHARE_HISTORY=1             # shares history between all sessions.

#
# Temporary Files
#

[ -n "$TMPDIR" ] || export TMPDIR=/tmp/$LOGNAME
[ -d "$TMPDIR" ] || mkdir -p -m 700 $TMPDIR

TMPPREFIX=$TMPDIR/zsh

