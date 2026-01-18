#If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
source ~/.zplug/init.zsh

zplug "dracula/zsh", as:theme
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "~/.zsh/zsh-autosuggestions", from:local
zplug "~/.zsh/zsh-autocomplete", from:local

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


export FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# complete -o nospace -C /usr/bin/aws-sso aws-sso.

autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/bin/terraform terraform

alias vim=nvim
export VISUAL=$(which nvim)
export EDITOR="$VISUAL"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go 
export GOROOT=/usr/local/go 
export GOBIN=$GOPATH/bin 
export PATH=$PATH:$GOBIN

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# pnpm
export PNPM_HOME="/home/$USER/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

zplug load
