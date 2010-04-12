### History ###
HISTFILE=~/.history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory hist_ignore_all_dups share_history

### Keys ###
bindkey -e
function termbindkey () {
    [[ -z "$terminfo[$1]" ]] || bindkey "$terminfo[$1]" $2
}
termbindkey kdch1   delete-char
termbindkey khome   beginning-of-line
termbindkey kend    end-of-line
termbindkey kich1   overwrite-mode
termbindkey kpp     emacs-backward-word
termbindkey knp     emacs-forward-word

### Completion ###
autoload -Uz compinit
compinit

### Prompt ###
if [[ "$TERM" != "dumb" ]]; then
    export PROMPT='%B%(?..[%?] )%b%n@%U%m%u%F{blue}%B%#%b%f '
    export RPROMPT="%F{green}%~%f"
else
    export PROMPT="%(?..[%?] )%n@%m %~ %# "
fi

### Options ###
setopt autocd

### Functions and aliases ###
alias ge="outofterm gedit"
alias nau="outofterm nautilus ."

function mplayer() {
    gnome-screensaver-command --inhibit &
    /usr/bin/mplayer $@
    kill $!
}

### Helper functions ###
function outofterm () {
    command=$1
    shift
    $command $@ >/dev/null 2>&1 &!
}

