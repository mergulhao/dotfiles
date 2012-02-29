# If running interactively, then:
if [ "$PS1" ]; then
	
	#Exportando as Variaveis
    HISTSIZE=5000
    export HISTFILE=~/.history/${HOSTNAME} 
    export HISTCONTROL=ignoredups
#    export EDITOR="mate -w"
#    export CVSEDITOR="mate -w"
#    export SVN_EDITOR="mate -w"
#    export GIT_EDITOR="mate -w"

    #Adiona os scripts no PATH.
    if [ -d ~/bin ]; then
	    export PATH=$PATH:~/bin
    fi
    export PATH=/usr/local/mysql/bin:/opt/local/lib/postgresql83/bin:$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/mongodb/bin
    
    #Controle de Historico
    if [ ! -d ~/.history ]; then
	    mkdir ~/.history
    fi
    
    # Redeparede
    alias flex1='ssh flex1'
    alias util='ssh util'
    alias ts='rake ts:index && rake ts:start'
    alias lts='load && ts'
    alias tst='rake ts:stop RAILS_ENV=test; loadt && rake ts:index RAILS_ENV=test && rake ts:start RAILS_ENV=test'
    alias stst='rake ts:stop RAILS_ENV=test; sloadt && rake ts:index RAILS_ENV=test && rake ts:start RAILS_ENV=test'
    
    #Cores
    COLOR1="\[\033[0;36m\]"
    COLOR2="\[\033[0;32m\]"
    COLOR3="\[\033[0;36m\]"
    COLOR4="\[\033[0;39m\]"
    
    if [ "$UID" = "0" ]; then
	    # I am root
	    COLOR2="\[\033[1;31m\]"
    fi
    
    # EOP="\[\033\033\134\]"
  	parse_git_branch() {
  	  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  	}
        rvm_version() {
          ~/.rvm/bin/rvm-prompt i v g
        }
    PS1="$COLOR2\$(rvm_version) $COLOR3\u@\h$COLOR2:$COLOR1\w$COLOR2\$(parse_git_branch)$COLOR1\\$ $COLOR4$EOP"
fi

if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

#if [ -f ~/Desenvolvimento/bin/bash_development_configs ]; then
#    . ~/Desenvolvimento/bin/bash_development_configs
#fi

if [ -f ~/Desenvolvimento/goodies/console_goodies.sh ]; then
    . ~/Desenvolvimento/goodies/console_goodies.sh
fi

if [ -f ~/Desenvolvimento/bin/git_completion.sh ]; then
    . ~/Desenvolvimento/bin/git_completion.sh
fi

alias gitx="open -a /Applications/GitX.app ."
alias mate='open -a TextMate.app'

##
# Your previous /Users/mergulhao/.bash_profile file was backed up as /Users/mergulhao/.bash_profile.macports-saved_2010-06-16_at_13:00:46
##

# MacPorts Installer addition on 2010-06-16_at_13:00:46: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

alias imersao='~/Desenvolvimento/bin/rknock-imersao start; ssh railsapps@208.88.124.101; ~/Desenvolvimento/bin/rknock-imersao stop'
