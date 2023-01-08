# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# Shell options
#
# See man bash for more options...
set -o vi
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreof
#
# Use case-insensitive filename globbing
shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Completion Options
#
# Uncoment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=500000
export HISTSIZE=100000
export HISTTIMEFORMAT="%m/%d/%y %T "
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls comand as well
#
# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# https://mhoffman.github.io/2015/05/21/how-to-navigate-directories-with-the-shell.html
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'


if [ -f ~/projects/scripts/wsl/bash/.config/.bash_aliases ]; then
	. ~/projects/scripts/wsl/bash/.config/.bash_aliases
fi
if [ -f ~/projects/scripts/wsl/bash/.config/.bash_functions ]; then
	. ~/projects/scripts/wsl/bash/.config/.bash_functions
fi
if [ -f ~/projects/scripts/wsl/bash/.config/.docker_aliases ]; then
	. ~/projects/scripts/wsl/bash/.config/.docker_aliases
fi
if [ -f ~/projects/scripts/wsl/bash/.config/.git_aliases ]; then
	. ~/projects/scripts/wsl/bash/.config/.git_aliases
fi
if [ -f ~/projects/scripts/.git_prompt ]; then
	. ~/projects/scripts/.git_prompt
fi


# Powerline configuration
GOPATH=$HOME/go
function _update_ps1() {
	PS1="$($GOPATH/bin/powerline-go -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# or
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi

export PATH=/usr/local/bin:~/.local/bin:$PATH

export JAVA_HOME=/usr/lib/jvm/java-16-openjdk-amd64

. /usr/share/autojump/autojump.sh

# Start Docker daemon automatically when logging in if not running.
RUNNING=`ps aux | grep dockerd | grep -v grep`
if [ -z "$RUNNING" ]; then
    sudo dockerd > /dev/null 2>&1 &
    disown
fi


export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export LIBGL_ALWAYS_INDIRECT=1

