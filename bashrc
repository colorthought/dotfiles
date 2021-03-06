export PS1="\[\033[38;5;7m\]\u\[$(tput sgr0)\]\[\033[38;5;6m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

 #ls aliases
alias ll='ls -lG'
alias la='ls -A'
alias l='ls'
alias s='ls -CFlh'
alias sl='ls'

#ls coloring
export CLICOLOR=1

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# no more cd ../../../../ ; up command
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gp='git pull'


# ----------------------
# Other shortcut aliases
# ----------------------

alias c='clear'

# ----------------------
# Postgres-start and stop
# ----------------------
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
