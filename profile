#!/bin/sh

# aint no github touching this!!
. $HOME/.private-profile

# path
export PATH="/usr/local/bin/flatpaks:$PATH"

# xdg_runtime_dir
if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR=/tmp/xdg/$(id -u)-xdg-runtime-dir
	if [ ! -d "$XDG_RUNTIME_DIR" ]; then
		mkdir -p $XDG_RUNTIME_DIR
		chmod  0700 $XDG_RUNTIME_DIR
	fi
fi

export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus

# run desktop if tty1
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    labwc
fi

# prompt
PROMPT_COLOR="\033[32m"
if [ "$(id -u)" -eq 0 ]; then
    PROMPT_COLOR="\033[31m"
fi

export PS1="\[$PROMPT_COLOR\]\u [ \[\033[37m\]\w \[$PROMPT_COLOR\]]\\$ \[\033[0m\]"

# aliases
alias ls="ls -p --color=auto"
alias grep="grep --color=auto"
alias qemu_run_cd="qemu-system-x86_64 -m 512 -enable-kvm -bios /usr/share/ovmf/bios.bin -cdrom"
