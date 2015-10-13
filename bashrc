export PS1="\[\033[38;5;202m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]::\W\[$(tput sgr0)\] "

# ls aliases
alias ll='ls -lG'
alias la='ls -A'
alias l='ls -CFlh'
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
