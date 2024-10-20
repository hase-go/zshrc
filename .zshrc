
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="george"

plugins=(git zsh-syntax-highlighting you-should-use zsh-autocomplete)

source $ZSH/oh-my-zsh.sh



export JAVA_HOME=`/usr/libexec/java_home`

#alias for editer
alias emacs="/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs -nw"
alias vi="nvim"


#alias for command
alias ez="emacs ~/.zshrc"
alias vz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias cz="code ~/.zshrc"
alias ls="ls -FG"
alias lz="lazygit"
alias c="clear"
alias poke="pokemon-colorscripts"
alias code="open -a 'Visual Studio Code'" 

#alias for Webpage
alias ghub="open https://github.com/"
alias glab="open https://gitlab.com/funalab"
alias qnap="open https://drive.google.com/drive/u/0/folders/0AEq_17n2qX_iUk9PVA"
alias chatgpt="open https://chatgpt.com/?model=gpt-4o"
alias sushi="open https://sushida.net/play.html"

#alias for app
alias s="open -a Slack"
alias notion="open -a Notion"
alias ical="open -a Calendar"
alias ode="open -a Finder ~/ODE/ODE15"
alias f="open -a Finder"
alias dl="open -a Finder ~/Downloads"


setopt hist_ignore_all_dups
setopt share_history
setopt ignore_eof
unsetopt beep

autoload history-search-end
zle -N history-beginning-search-backward-exnd history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select
bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete

done-notify() {
  local var=$(echo $history[$HISTCMD] | sed -e "s/$0//" -e 's/ *; *//' -e 's/ *&& *//')
  osascript -e 'display notification "'"$var finished!"'" with title "Terminal"'
}

chpwd (){
  if [[ $(pwd) != $HOME ]]; then   
    ls -a;
  fi
}

fcd (){
      local dir
      dir=$(find ${1:-.} -path '*/\.*' -prune -o -name "Library" -prune -o -name "Pictures" -prune -o -type d -print 2> /dev/null | fzf +m) &&
      cd "$dir"
}

eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"

if [ -f "$HOME/.config/kitty/kitty.conf" ]; then
    alias ek="emacs ~/.config/kitty/kitty.conf"
    alias ck="code ~/.config/kitty/kitty.conf"
fi

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
poke -r

