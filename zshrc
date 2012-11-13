# Path to your oh-my-zsh configuration.
export PATH=/usr/local/bin:$PATH:/Applications/mit-scheme.app/Contents/Resources:/opt/local/bin:/usr/local/Cellar/vim/7.3.333/bin

#/Users/plagelao/.rvm/gems/ruby-1.9.2-p0/bin:/Users/plagelao/.rvm/gems/ruby-1.9.2-p0@global/bin:/Users/plagelao/.rvm/rubies/ruby-1.9.2-p0/bin:/Users/plagelao/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="plagelao"
setopt interactivecomments
# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
unsetopt correct_all
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

alias tmux="TERM=screen-256color-bce tmux"

# hitch
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#DBs
alias start_redis="redis-server /usr/local/etc/redis.conf"
alias start_mongo="mongod run --config /usr/local/Cellar/mongodb/2.0.4-x86_64/mongod.conf"

#git
blame() {
  git ls-tree -r HEAD|
  sed -re 's/^.{53}//'|
  while read filename; do file "$filename"; done|
  grep -E ': .*text'|
  sed -r -e 's/: .*//'|
  while read filename; do git blame "$filename"; done|
  sed -r -e 's/.*\((.*)[0-9]{4}-[0-9]{2}-[0-9]{2} .*/\1/' -e 's/ +$//'|
  sort|
  uniq -c;
}
alias commits="git shortlog -s -n"
