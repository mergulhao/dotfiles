# If running interactively, then:
if [ "$PS1" ]; then

  # aliases
  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi

  # history
  if [ ! -d ~/.history ]; then
    mkdir ~/.history
  fi

  # export
  export HISTSIZE=5000
  export HISTFILE=~/.history/${HOSTNAME}
  export HISTCONTROL=ignoredups
  export EDITOR="mate -w"
  export GIT_EDITOR="mate -w"

  # foreman
  export PORT=3000

  # ruby 1.9.3 gc improvements
  # https://gist.github.com/4136373
  # https://github.com/wayneeseguin/rvm/tree/master/patches/ruby/1.9.3/p374/railsexpress
  # https://github.com/skaes/rvm-patchsets
  export RUBY_GC_MALLOC_LIMIT=60000000
  export RUBY_GC_HEAP_FREE_SLOTS=200000

  # path
  export PATH=~/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin/:$PATH

  # my colors
  COLOR1="\[\033[0;36m\]"
  COLOR2="\[\033[0;32m\]"
  COLOR3="\[\033[0;36m\]"
  COLOR4="\[\033[0;39m\]"

  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  }

  rvm_version() {
    version=$(~/.rvm/bin/rvm-prompt i v g)

    if [ -z "$version" ]; then
      echo ""
    else
      echo "${version} "
    fi
  }
  # PS1="$COLOR2\$(rvm_version)$COLOR3\u@\h$COLOR2:$COLOR1\w$COLOR2\$(parse_git_branch)$COLOR1\\$ $COLOR4$EOP"
  PS1="$COLOR3\u@\h$COLOR2:$COLOR1\w$COLOR2\$(parse_git_branch)$COLOR1\\$ $COLOR4$EOP"
fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin

# ssh identity add
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1

# bash bookmarks
if [ -f ~/.bash_bashmarks ] ; then
  . ~/.bash_bashmarks
fi

# git completion
if [ -f ~/.bash_git_completion ] ; then
  . ~/.bash_git_completion
fi

# colorls: https://github.com/athityakumar/colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias lc='colorls -lA --sd'