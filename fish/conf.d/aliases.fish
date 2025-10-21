if status is-interactive
    alias gc="git clone" 
    alias gi="git init"
    alias ga="git add ."
    alias gs="git stage"
    alias gcm="git commit -m"
    alias gb="git branch -M"
    alias gr="git remote add origin"
    alias gpsh="git push -u origin"
    alias gpl="git pull"
    alias gitsheet="bat --style header --style snip --style changes --style header ~/git/gitsheet.txt"

    alias c="code ."

    alias mathup="curl https://raw.githubusercontent.com/leanprover-community/mathlib4/master/lean-toolchain -o lean-toolchain;lake update"

    alias rm='rmtrash'
    alias rmdir='rmdirtrash'

    # Replace ls with exa
    alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
    alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
    alias ll='exa -l --color=always --group-directories-first --icons'  # long format
    alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
    alias l.="exa -a | grep -E '^\.'"                                     # show only dotfiles
    alias ip="ip -color"


    alias l='exa -al --color=always --group-directories-first --icons' 
    alias sl='exa -al --color=always --group-directories-first --icons' 
    alias botp='btop'
    alias btpo='btop'

    # Replace some more things with better alternatives
    alias cat='bat --style header --style snip --style changes --style header'
    alias yay='paru'

    # Common use
    alias grubup="sudo update-grub"
    alias fixpacman="sudo rm /var/lib/pacman/db.lck"
    alias tarnow='tar -acf '
    alias untar='tar -xvf '
    alias rmpkg="sudo pacman -Rdd"
    alias psmem='ps auxf | sort -nr -k 4'
    alias psmem10='ps auxf | sort -nr -k 4 | head -10'
    alias wget='wget -c'
    alias upd='/usr/bin/update'
    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'
    alias .....='cd ../../../..'
    alias ......='cd ../../../../..'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias hw='hwinfo --short'                                   # Hardware Info
    alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
    alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages

    # Get fastest mirrors
    alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
    alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
    alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
    alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

    # Help people new to Arch
    alias apt='man pacman'
    alias apt-get='man pacman'
    alias please='sudo'
    alias tb='nc termbin.com 9999'

    # Cleanup orphaned packages
    alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

    # Get the error messages from journalctl
    alias jctl="journalctl -p 3 -xb"

    # Recent installed packages
    alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
end
