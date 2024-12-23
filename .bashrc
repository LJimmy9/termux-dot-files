eval "$(fzf --bash)"

if [ -n "$BASH_VERSION" ]; then
    # Bash detected
    PS1='\[\e[0;32m\]\u@\h \[\e[0;33m\]\w\[\e[0m\]\n\[\e[0;36m\] > '
elif [ -n "$ZSH_VERSION" ]; then
    # Zsh detected
    NEWLINE=$'\n'
    PROMPT="%n@%m:%~${NEWLINE}> "
else
    echo "Unknown shell. Custom prompt not set."
fi

alias ls="ls -la"

alias gs="git status"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gp="git push"
alias gco="git checkout"
