# source the user's bashrc if it exists
if [ -f "${HOME}/dotfiles/osx/bash/.bashrc" ] ; then
	source "${HOME}/dotfiles/osx/bash/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#    PATH="${HOME}/bin:${PATH}"
# fi

# Set MANPATH so it includes user's private man if it exists
# if [ -d "${HOME}/man" ] ; then
#    MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes user's private info if it exists
# if [ -d "${HOME}/info" ] ; then
#    INFOPATH="${HOME}/info:${INFOPATH}"
# fi

