function git-branch-name
{
	echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

function git-dirty {
    st=$(git status 2>/dev/null | tail -n 1)
    if [[ $st != "nothing to commit, working directory clean" ]]
    then
        echo "*"
    fi
}
function git-unpushed {
    brinfo=$(git branch -v | grep $(git-branch-name))
    if [[ $brinfo =~ ("[ahead "([[:digit:]]*)) ]]
    then
        echo "(${BASH_REMATCH[2]})"
    elif [[ $brinfo =~ ("[behind "([[:digit:]]*)) ]]
    then
        echo "(-${BASH_REMATCH[2]})"
    fi
}
function gitify {
    status=$(git status 2>/dev/null | tail -n 1)
    if [[ $status == "" ]]
    then
        echo ""
    else
        echo $(git-branch-name)$(git-dirty)$(git-unpushed)
    fi
}
function make-shell {
    local RED="\[\033[0;31m\]"
    local GREEN="\[\033[0;32m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"
    local CYAN="\[\033[0;36m\]"
    local YELLOW="\[\033[0;33m\]"

    PS1="${GREEN}\u${YELLOW}@${CYAN}\h${GREEN} \w${RED} \$(gitify)${GREEN}${YELLOW}\n\$ "
}
alias git='LC_ALL=en_US git'
make-shell
# set -o vi
export MY_BUNDLE_ENV='dev'
export EDITOR='vim'
# This will tinker with the value of TERM in order to convince certain apps
# # that we can, indeed, display color in their window.
#
if [ -n "$COLORTERM" ]; then
  export TERM=xterm-color
fi
#
if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-color
fi
export CLICOLOR=1
eval "$(direnv hook bash)"

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
