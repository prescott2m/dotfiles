# .kshrc: config file for oksh 7.8

# run x if tty1
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	startx
fi

# prompt
PROMPT_COLOR="\033[32m"
if [ "$(id -u)" -eq 0 ]; then
    PROMPT_COLOR="\033[31m"
fi

export PS1="\[$PROMPT_COLOR\]\u [ \[\033[37m\]\w \[$PROMPT_COLOR\]]\\$ \[\033[0m\]"

# aliases
alias ls="ls -p --color=always"
alias grep="grep --color=always"
alias diff="diff --color=always"
alias qemu_run_slinux="qemu-system-x86_64 -m 512 -enable-kvm -cdrom slinux.iso -bios /usr/share/qemu/OVMF.fd"
