# temp
alias vps='ssh vps'
alias sl='rknock-sl start; ssh clientela-sl; rknock-sl stop'
alias hz='ssh clientela-hz'

# random
alias gitx="open -a /Applications/GitX.app ."
alias fullupdate='sudo softwareupdate -i -a; brew update; brew upgrade; rvm get latest --auto-dotfiles'
alias ll="ls -lah"
alias rm-ds-store="find . -name '.DS_Store' -type f -delete"
alias git-clear-remotes="git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d"

# git
# alias git=hub

# rails
alias docker-up='docker-compose up'
alias docker-down='docker-compose down && docker-clean'
alias f='docker-compose run --service-ports app foreman start'
alias c='docker-compose run app rails c'
alias prod='docker-compose run app rake jumpup:production'
alias rails='docker-compose run app rails'
alias drake='docker-compose run app rake'
alias int='docker-compose run app rake integrate'
alias dbsetup='docker-compose run app rake db:setup'
alias rspec='docker-compose run app rspec'
alias migrate='docker-compose run app rake db:migrate db:test:load'
alias redo='docker-compose run app rake db:migrate:redo db:test:load'
alias back='docker-compose run app rake db:rollback db:test:load'
alias seed='docker-compose run app rake db:seed'
alias unlock='docker-compose run app rake jumpup:integration:unlock'

# docker
alias docker-clean="docker ps -a | grep 'Exited\|Created' | cut -d ' ' -f 1 | xargs docker rm"
alias docker-build="docker-compose build --build-arg GIT_USER_EMAIL=`git config user.email` --build-arg GIT_USER_NAME='`git config user.name`' app; docker-compose run app 'cp /tmp/Gemfile.lock /app/'; docker-compose run app bundle"
alias docker-build-node='docker-compose build app; docker-compose run app yarn'

# ruby

# Borrowed from Mislav (http://github.com/mislav/dotfiles/tree/master/bash_aliases)
# really awesome function, use: cdgem <gem name>, cd's into your gems directory
# and opens gem that best matches the gem name provided
function cdgem {
  cd `gem env gemdir`/gems
  cd `ls | grep $1 | sort | tail -1`
}
function mategem {
  gemdir=$(gem env gemdir)/gems
  name=$(ls $gemdir | /usr/bin/ruby -rubygems -r rubygems/version -e 'gem = STDIN.lines.
      map {|l| l =~ /-([^-]+)\s*$/; [$`, Gem::Version.new($1)] if $` == ARGV.first }.
      compact.sort_by(&:last).last
    print gem.join("-") if gem
    ' $1)

  if [ -z "$name" ]; then
    echo "gem not found" 1>&2
  else
    $EDITOR $gemdir/$name
  fi
}

alias gemmate='mategem'