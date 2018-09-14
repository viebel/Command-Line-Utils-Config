bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm heroku git-flow zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export EDITOR="emacs -nw"
export VISUAL="emacs -nw"

if [ -f $HOME/.rvm/scripts/rvm ]; then
  source $HOME/.rvm/scripts/rvm
fi

# User configuration

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/viebel/bin:/Users/viebel/.rvm/bin:`yarn global bin`:/Users/viebel/Library/Python/2.7/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# for cljs dev https://github.com/clojure/clojurescript/wiki/Running-the-tests
export DYLD_FRAMEWORK_PATH=/Applications/WebKit.app/Contents/Frameworks/10.9/
PATH=$PATH:/Applications/WebKit.app/Contents/Frameworks/10.9/JavaScriptCore.framework/Resources
export JSC_HOME=/Applications/WebKit.app/Contents/Frameworks/10.9/JavaScriptCore.framework/Resources

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="./node_modules/.bin/:$PATH"
### fast cljsbuild
LEIN_FAST_TRAMPOLINE=y
export LEIN_FAST_TRAMPOLINE
alias cljsbuild="lein trampoline cljsbuild $@"
alias emacs='emacs -nw'
export PATH="$HOME/.yarn/bin:$PATH"

# Android SDK

export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.4.1_1
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/viebel/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/viebel/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/viebel/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/viebel/google-cloud-sdk/completion.zsh.inc'
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#very important for gpg (and for lein deploy) - http://unix.stackexchange.com/questions/217737/pinentry-fails-with-gpg-agent-and-ssh
export GPG_TTY=`tty`
