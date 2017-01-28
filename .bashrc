# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

export PS1="\[\033[0m\][\[\033[33m\]${SHLVL}\[\033[0m\]\[\033[0m\]\[\033[0m\]|\[\033[36m\]\w\[\033[0m\]]\[\033[0m\]"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
alias grep='grep --color'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# for linux
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#for Mac os
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi


bind '"\C-t":history-search-backward'

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/bin:~/Command-Line-Utils-Config/bin:/opt/local/bin

#set -o vi #navigate the command line terminal in the vi way
alias cd=pushd
export EDITOR=vi
export VISUAL=vi
#ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++
#export IFS=$(echo -en "\n\b") # file separtor for the for loop
#export RUBYOPT=rubygems #needed for correct gem path
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias pbcopy='xclip -selection clipboard' #copy to clipboard
alias pbpaste='xclip -selection clipboard -o' #paste from clipboard

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -V`
