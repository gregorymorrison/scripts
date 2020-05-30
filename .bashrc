# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# Shell options
#
# See man bash for more options...
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
export PROMPT_COMMAND="history -a"
source "${HOME}/.git_prompt"

# https://mhoffman.github.io/2015/05/21/how-to-navigate-directories-with-the-shell.html
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Aliases
#
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi
if [ -f ~/.docker_aliases ]; then
	. ~/.docker_aliases
fi
if [ -f ~/.git_aliases ]; then
	. ~/.git_aliases
fi
if [ -f ~/.git_prompt ]; then
	. ~/.git_prompt
fi

# https://github.com/mhoffman/mhoffman.github.com/blob/master/_posts/2015-05-21-how-to-navigate-directories-with-the-shell.md
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export DISPLAY=localhost:0

