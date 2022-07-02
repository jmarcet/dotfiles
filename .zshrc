# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh

if [ ! -e $ZSH ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH
fi

if [ ! -e $ZSH/custom/themes/powerlevel10k ]; then
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH/custom/themes/powerlevel10k
fi

if [ ! -e $HOME/.tmuxifier ]; then
    git clone https://github.com/jimeh/tmuxifier.git $HOME/.tmuxifier
fi

_ask_bool() {
    local default="$1"; shift;
    local answer="$default"

    case "$default" in
        0) echo -n "$* (y/N): ";;
        *) echo -n "$* (Y/n): ";;
    esac
    read answer
    case "$answer" in
        y*|Y*) answer=1;;
        n*|N*) answer=0;;
        *) answer="$default";;
    esac

    [ "$answer" -gt 0 ]
}

_ask_tmux() {
    # Ask interactively whether to launch a new tmux session or attach to an
    # existing one, except if running within tmux already or within vscode
    if [ -z "${TMUX}" -a "${TERM_PROGRAM}" != "vscode" ]; then
        if [ -e /etc/openwrt_release ]; then  # OpenWRT
            local PRIO=1
            source /etc/profile
        else
            local PRIO=0
        fi
        if [ -z "$(pgrep -f -u $LOGNAME 'tmux -2u new-session -s default')" ]; then
            _ask_bool 1 "Run new tmux instance ?" && tmux -2u new-session -s default
        else
            _ask_bool $PRIO "Attach to running tmux ?" && tmux -2u attach -t default
        fi
    fi
}

_pyenv() {
    if [ -z "$(whence pyenv)" ] && [ ! -e $HOME/.pyenv ]; then
        curl https://pyenv.run | bash
    fi

    export PYENV_ROOT=$HOME/.pyenv
    command -v pyenv &>/dev/null || export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    if [ -n "$(whence nvim)" ] && [ -z "$(pyenv virtualenvs | grep nvim)" ]; then
        pip3 install --user virtualenv
        pyenv virtualenv nvim
        $HOME/.pyenv/versions/nvim/bin/python -m pip install pynvim
    fi
    eval "$(pyenv virtualenv-init -)"
}

_ask_tmux

[ $UID -ne 0 ] && _pyenv

# if [[ -n "`env | grep SCHROOT`" ]]; then
#     [[ -n "$SCHROOT_SESSION_ID" ]] && export PROMPT="$SCHROOT_SESSION_ID % $PROMPT"
#     export DISPLAY=:1
#     [ -e /etc/arch-release ] && export `dbus-launch`
#     echo ""Welcome to $SCHROOT_SESSION_ID chroot!""
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Ctrl+R history searching with vim bindings
bindkey -M viins '' history-incremental-search-backward
bindkey -M vicmd '' history-incremental-search-backward

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerline"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# ZSH_THEME_RANDOM_CANDIDATES=( "blinks" "candy-kingdom" "crcandy" "crunch"
# "dallas" "dst" "edvardm" "fino-time" "fletcherm" "jaischeema"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(adb archlinux autopep8 catimg colored-man-pages copybuffer
    colorize common-aliases cp docker-compose docker-machine fancy-ctrl-z git
    gitignore history history-substring-search kate man nmap mosh pep8 pip
    pipenv pylint python repo rsync sudo systemd tig tmux transfer urltools
    vim-interaction vi-mode virtualenv wp-cli yarn zsh-navigation-tools
    aliases emoji encode64 gcloud fzf github httpie kubectl kubectx npm sudo zsh-interactive-cd)

# User configuration

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=$HOME/.zfunc

[ -d /etc/X11/xinit/xinitrc.d ] && \
    [ -n "$(ls /etc/X11/xinit/xinitrc.d/ )" ] && \
    source /etc/X11/xinit/xinitrc.d/*

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[ -d $ZSH_CACHE_DIR ] || mkdir $ZSH_CACHE_DIR
export ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f $HOME/.p10k.zsh ] && source $HOME/.p10k.zsh

p10k reload

[ -e $HOME/.bash_aliases ] && source $HOME/.bash_aliases

[ -e /etc/.openwrt_buidroot ] && cd $HOME/src/openwrt-master-x64

[ -s $HOME/.tmuxifier/init.sh ] && source $HOME/.tmuxifier/init.sh
