# enable terminal colors
# LSCOLORS needs 11 sets of letters indicating foreground and background colors:
# 1    directory
# 2    symbolic link
# 3    socket
# 4    pipe
# 5    executable
# 6    block special
# 7    character special
# 8    executable with setuid bit set
# 9    executable with setgid bit set
# 10   directory writable to others, with sticky bit
# 11   directory writable to others, without sticky bit
#
# The possible values are:
# a  black
# b  red
# c  green
# d  brown
# e  blue
# f  magenta
# c  cyan
# h  light grey
# A  block black, usually shows up as dark grey
# B  bold red
# C  bold green
# D  bold brown, usually shows up as yellow
# E  bold blue
# F  bold magenta
# G  bold cyan
# H  bold light grey; looks like bright white
# x  default foreground or background

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LESSOPEN='| /opt/local/bin/lesspipe.sh %s'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsh='ls -lhG' # alias for ls to use long listing format, human readable sizes, sort and don't show groups

alias src='. ~/.bash_profile' # source the ~/.bash_profile (read its contents and execute them)
alias ports='nmap localhost' # lists open ports on system
alias his='history | grep '

alias ipyn='ipython notebook'
alias ipyqt='ipython qtconsole --pylab inline'

export HISTTIMEFORMAT="%Y%m%d-%T "
HISTSIZE=3000
HISTFILESIZE=100000
HISTIGNORE="&:pwd:ls:[bf]g:exit:[ \t]*"
shopt -s cmdhist
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# prefer the emacs installed by Homebrew
#alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
#alias emacsclient="/usr/local/Cellar/emacs/HEAD/bin/emacsclient"

# for vim
alias g='vim --remote-silent'

#color coded man pages
#export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
#export LESS_TERMCAP_me=$'\E[0m' # end mode
#export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m' # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Use from homebrew
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/bin:$PATH
##

# Use my custom bin directory
export PATH=$HOME/bin/osx:$PATH
export PATH=$HOME/bin/common:$PATH

# perlbrew
#source ~/perl5/perlbrew/etc/bashrc
#

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

if [ -f "$HOME/.bash_ps1" ]; then
    . "$HOME/.bash_ps1"
fi

# explicitly set xterm as 256 color so we get pretty usage
export TERM=xterm-256color

#source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

#show banner
OSXey.sh -c

#git autocompletion
#git-completion.bash from
#curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -f ~/.git-completion.bash ]; then
        . ~/.git-completion.bash
fi
