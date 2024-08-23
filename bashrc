#
# ~/.bashrc
#

# coloring ls
# This only works if you have the DIR_COLORS files
# rn im too lazy to get it
# eval "$(dircolors -b /etc/DIR_COLORS)"

# ssh to my server
alias nyxroot='ssh -i ~/.ssh/nyx_ed25519_key -p2222 root@nyx'
alias nyx='ssh -i ~/.ssh/nyx_ed25519_key -p2222 nick@nyx'

# colors
blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# alias v='nvim'
# alias vim='nvim'

alias t='tmux'
alias ta='tmux attach -t'

# git stuff
alias gs='git status'
alias gl='git log'
alias gt='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias ga='git add'
alias gaa='git add --all'
alias gp='git pull'
alias gb='git branch -a'
alias gc='git commit'


# alias todo='nvim ~/.todo'
alias bashrc='nvim ~/.bashrc'
alias kittyrc='nvim ~/.config/kitty/kitty.conf'
alias vimrc='nvim ~/.config/nvim/init.lua'
alias tmuxrc='nvim ~/.tmux.conf'

# alias sound='alsamixer'

# alias pdfv='mupdf -r 226'${1}'.pbludf'

source /usr/share/git/completion/git-prompt.sh
PS1=${blu}'\u'${cyn}'::'${wht}'\w'${cyn}'$(__git_ps1 "::[%.30s]")'${wht}'> '

# this isn't working for some reason
# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# history optimizations
# command is 'history'
HISTTIMEFORMAT="%F %T"
HISTCONTROL=ignoredups

# setting up ocaml enviroment variables
# not using ocaml atm
# eval $(opam env)

# something about transparency
# dont need transparency rn
# term="$(cat /proc/$PPID/comm)"

# dont need transparency rn
# if [[ $term = "st" ]]; then
	#transset-df "1.0" --id "$WINDOWID" >/dev/null
# fi

# not using rust either rn
# . "$HOME/.cargo/env"

# not using this bin atm
# PATH=$PATH:$HOME/.local/bin

# not developing os rn
# export NICK_OS_TARGET=i686-elf
# export NICK_OS_SYSROOT=$HOME/nickos/sysroot

