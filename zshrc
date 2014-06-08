PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/bin:$PATH

source $HOME/.prompt
export EDITOR=vim

alias sql='postgres -D /usr/local/var/postgres'
alias pair="tmate show-messages | ruby -e 'puts ARGF.read.to_s[/.*Remote session: (.*)/, 1]' | pbcopy"
