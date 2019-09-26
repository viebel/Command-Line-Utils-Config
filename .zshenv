
export EDITOR="vim"
export VISUAL="vim"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/viebel/bin:/Users/viebel/.rvm/bin:/Library/TeX/texbin"
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


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/viebel/google-cloud-sdk/path.zsh.inc ]; then
    source '/Users/viebel/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/viebel/google-cloud-sdk/completion.zsh.inc ]; then
    source '/Users/viebel/google-cloud-sdk/completion.zsh.inc'
fi

if [ -f /Users/viebel/.cycoenv ]; then
    source /Users/viebel/.cycoenv
fi
