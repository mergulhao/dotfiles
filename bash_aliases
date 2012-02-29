# git
alias gb="git branch -a"
alias gc="git commit -a"
alias gd="git diff | mate"
alias gl="git pull"
alias gp="git push"
alias gta="git status"
alias gr="git reset --hard"
alias ga="git add ."
alias gm="git checkout master"

# rails 
alias c='rails c'
alias s='rails s'
alias int='rake integrate'
alias migrate='rake db:migrate && rake db:test:clone'
alias redo='rake db:migrate:redo && rake db:test:clone'
alias back='rake db:rollback && rake db:test:clone'