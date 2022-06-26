set --export SHELL /usr/bin/fish
set -e fish_greeting

alias vim="nvim"

source (/usr/local/bin/starship init fish --print-full-init | psub)
