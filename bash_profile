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
  export EDITOR="mate"
  export GIT_EDITOR="mate"

  # path
  if [ -d ~/bin ]; then
    export PATH=$PATH:~/bin
  fi
  export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/opt/local/lib/postgresql83/bin:/usr/local/mongodb/bin:$PATH

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
  PS1="$COLOR2\$(rvm_version)$COLOR3\u@\h$COLOR2:$COLOR1\w$COLOR2\$(parse_git_branch)$COLOR1\\$ $COLOR4$EOP"
fi

# rvm
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

if [ -f ~/Desenvolvimento/goodies/console_goodies.sh ]; then
  . ~/Desenvolvimento/goodies/console_goodies.sh
fi

# ssh identity add
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1

# git completion
if [ -f ~/.bash_git_completion ] ; then
  . ~/.bash_git_completion
fi