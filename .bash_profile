  echo 'Loading ~/.bash_profile'

# Load brews before system tools
PATH="/usr/local/bin:$PATH"

# Use Homebrew's directories rather than .rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# Enable shims and autocompletion for rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Load psql
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

alias irb='pry'
alias be='bundle exec'
alias dt='cd ~/Desktop'




MILLION=1000000
export HISTFILESIZE=$MILLION
export HISTSIZE=$MILLION

# Load NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT_COLOR="\e[38;5;202m"

export PS1="\W$ \$(parse_git_branch)\[\033[00m\] :"
export EDITOR="atom -w"
