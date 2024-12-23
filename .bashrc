eval "$(fzf --bash)"
NEWLINE=$'\n'
PROMPT="%n@%m:%~${NEWLINE}> "

PS1='\[\e[0;32m\]\u@\h \[\e[0;33m\]\w\[\e[0m\]\n\[\e[0;36m\] \$ '


alias ls="ls -la"

alias gs="git status"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gp="git push"
alias gco="git checkout"
