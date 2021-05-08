#-------------------------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -AlF'
alias l='ls -lF'
alias c='clear'
alias s='python -m http.server'
alias d='cd /mnt/XDATA/Downloads'
alias o='obs --startrecording --scene x'

# другие алиасы
[ -f $HOME/.bashrc_aliases ] && . $HOME/.bashrc_aliases
#-------------------------------------------------------------------
if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    PS_isSSH="SSH"
fi

# \e[COLOR;BOLDm
#### -----------date----------- -user@host- --path-- ------isSSH------ ---old---
PS1='\e[35;1m[$(date +"%F %T")] \e[32m\u@\H \e[34m\w \e[31m[$PS_isSSH] \e[0m[$?]
\$ '
#-------------------------------------------------------------------
# игнорировать дубликаты и пустые строки для истории
HISTCONTROL=ignoreboth

# добавлять в файл истории (не перезаписывать)
shopt -s histappend

# настройка длинны истории
HISTSIZE=10000
HISTFILESIZE=10000

# фикс для цветов termit
# по умолчанию TERM=xterm-termite
# TERM=xterm-256color
if [ "$TERM" = xterm-termite ]; then TERM=xterm-256color; fi
#-------------------------------------------------------------------
mytar_z() {
    tmp=mytar_$(date +%Y%m%d_%H%M%S).tar.gz
    tar -czvf $tmp "$1"
}
mytar_u() {
    tmp=mytar_$(date +%Y%m%d_%H%M%S)
    mkdir $tmp          && \
    mv "$1" $tmp/       && \
    cd $tmp             && \
    tar -xvf "$1"       && \
    rm "$1"             && \
    cd ..
}
myunzip() {
    tmp=myunzip_$(date +%Y%m%d_%H%M%S)
    mkdir $tmp          && \
    mv "$1" $tmp/       && \
    cd $tmp             && \
    unzip "$1"          && \
    rm "$1"             && \
    cd ..
}
myzipedit() {
    echo "Usage: zipedit archive.zip file.txt"
    unzip "$1" "$2" -d /tmp 
    vim /tmp/$2 && zip -j --update "$1"  "/tmp/$2" 
}
mypass-copy() {
    python3 /mnt/enote/00_FILES/PASS/scripts/mypass-copy.py
}
mypass-browser() {
    python3 /mnt/enote/00_FILES/PASS/scripts/mypass-browser.py
}
mytg() {
    curl \
        --data-urlencode "value1=$1" \
        "https://maker.ifttt.com/trigger/shell/with/key/bxXRMSLxeTXqTGAqC3flfe" &> /dev/null
}
#-------------------------------------------------------------------
