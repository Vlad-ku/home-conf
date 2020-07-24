#-------------------------------------------------------------------
# цветная строка ввода (юзер и путь)

autoload -U colors && colors
export PROMPT="╭─%{$fg_bold[green]%}%n@%M%{$reset_color%} %{$fg_bold[blue]%}%~%{$reset_color%}
╰─%B$%b "
#-------------------------------------------------------------------
# настройки

# Файл истории
export HISTFILE=~/.zsh_history
# максимальное число команд, хранимых в истории и сеансе
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE

# Игнopupoвaть вce пoвтopeнuя команд
setopt HIST_IGNORE_ALL_DUPS
# Удалять из истории пустые строки
setopt HIST_REDUCE_BLANKS
#setopt HIST_IGNORE_SPACE

# фиксы delete, home, end клавиш
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# автокомплит можно выбирать стрелками (не очень функция)
# setopt menucomplete
# zstyle ':completion:*' menu select=1 _complete _ignored _approximate
#-------------------------------------------------------------------
