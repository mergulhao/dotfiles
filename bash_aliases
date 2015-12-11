# temp
alias vps='ssh vps'
alias sl='rknock-sl start; ssh clientela-sl; rknock-sl stop'
alias hz='ssh clientela-hz'

# random
alias gitx="open -a /Applications/GitX.app ."
alias fullupdate='sudo softwareupdate -i -a; brew update; brew upgrade; rvm get latest --auto-dotfiles'

# git
alias git=hub

# rails
alias f='foreman start'
alias c='rails c'
alias ss='rails s thin'
alias int='rake integrate'
alias migrate='rake db:migrate'
alias redo='rake db:migrate:redo'
alias back='rake db:rollback'
alias seed='rake db:seed'
alias unlock='rake jumpup:integration:unlock'

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