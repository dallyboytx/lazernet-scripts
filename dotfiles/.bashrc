# ~/.bashrc — lazernet standard config
# Part of dallyboytx/lazernet-scripts — install.sh symlinks this

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Lazernet SSH shortcuts
alias core='ssh dallas@192.168.1.114'
alias stow='ssh dallas@192.168.1.115'
alias flint='ssh root@192.168.1.1'
alias ollama='ssh dallas@192.168.1.30'
alias mint='ssh dallas@192.168.1.101'

# Meshnet aliases (works from anywhere)
alias core-mesh='ssh dallas@100.80.221.63'

# Common utils
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias ports='ss -tulpn'
alias myip='curl -sf https://api.nordvpn.com/v1/helpers/ips/insights | python3 -c "import json,sys; d=json.load(sys.stdin); print(d[\"ip\"], \"protected:\", d[\"protected\"])"'

# qBittorrent shortcuts
alias qbt-all='qbt-status all'
alias qbt-tv='qbt-status tv'
alias qbt-movies='qbt-status movies'
alias qbt-records='qbt-status records'
alias qbt-audio='qbt-status audio'
alias qbt-books='qbt-status books'
alias qbt-sports='qbt-status sports'

alias qbt-rescan-all='qbt-rescan all'
alias qbt-rescan-tv='qbt-rescan tv'
alias qbt-rescan-movies='qbt-rescan movies'
alias qbt-rescan-records='qbt-rescan records'
alias qbt-rescan-audio='qbt-rescan audio'
alias qbt-rescan-books='qbt-rescan books'
alias qbt-rescan-sports='qbt-rescan sports'

# Git shortcuts
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline -10'

# Lazernet service shortcuts (run on core)
alias watchdog-log='journalctl -u lazernet-watchdog -f'
alias doctor='python3 /opt/lazernet/doctor/main.py'
alias qbt-check='sudo /usr/local/bin/qbt-vpn-check.sh && echo "VPN OK"'

# History settings
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Prompt with hostname color
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
