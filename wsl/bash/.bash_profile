# source the user's bashrc if it exists
if [ -f "${HOME}/.config/.bashrc" ] ; then
	source "${HOME}/.config/.bashrc"
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


export PATH="$HOME/.cargo/bin:$PATH"
