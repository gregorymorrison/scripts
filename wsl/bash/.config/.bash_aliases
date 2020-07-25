# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask. For example, alias rm='rm -i' will mask the rm
# application. To override the alias instrution use a \ before, ie
# \rm will call the real rm not the alias.

# some more ls aliases
alias ll='ls -alF'
alias ls='ls -A'
alias l='ls -CF'

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                    # raw control characters
alias whence='type -a'                  # where, of a sort
alias grep='grep --color'               # show differences in color
alias egrep='egrep --color=auto'        # show differences in color
alias fgrep='fgrep --color=auto'        # show differences in color

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'           # classify files in color
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."
alias ............="cd ../../../../../../../../../../.."
alias .............="cd ../../../../../../../../../../../.."

alias targz='tar -czvf "$1" "$2"'
alias untargz='tar -xzvf "$1" "$2"'

alias freaks="echo 'Gooble Gobble, we accept you, one of us!'"
alias whale='docker run docker-whale'

