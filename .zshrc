
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="arrows"


plugins=(git zsh-syntax-highlighting you-should-use zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

alias emacs="/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs -nw"
export JAVA_HOME=`/usr/libexec/java_home`
 
alias ez="emacs ~/.zshrc"
alias sz="source ~/.zshrc"
alias ls="ls -FG"
alias lz="lazygit"
alias c="clear"
alias poke="pokemon-colorscripts"

setopt hist_ignore_all_dups
setopt share_history
setopt ignore_eof
unsetopt beep
 
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
  
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select
bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete

chpwd (){
    ls -A;
}

fcd(){
      local dir
      dir=$(find ${1:-.} -path '*/\.*' -prune -o -name "Library" -prune -o -name "Pictures" -prune -o -type d -print 2> /dev/null | fzf +m) &&
      cd "$dir"
}

eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"

if [ -f "$HOME/.config/kitty/kitty.conf" ] ; then
    alias ek="emacs ~/.config/kitty/kitty.conf"
    alias ck="code ~/.config/kitty/kitty.conf"
fi

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

poke -r



