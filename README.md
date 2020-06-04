# oasis qemu image

To launch in serial mode:

	./run

To launch in graphics mode:

	./run-qemu

## QEMU monitor

In serial mode, you can switch to the QEMU console monitor with
`Ctrl-a c`. In graphics mode, it is started by default.

## Text editor

A vi-like text editor, vis(1) can be used. It does not work properly
in serial mode, so should only be used in graphics mode.

ed(1) is also available in serial mode if you know how to use it.

## Display server

In graphics mode, you can launch velox with

	swc-launch velox

velox works similarly to dwm, and has similar default keybindings:

- Launch a terminal: `Alt-Shift-Enter`
- Launch a browser: `Alt-b`
- Launch dmenu: `Alt-r`
- Cycle window focus: `Alt-[jk]`
- Move window to/from master area: `Alt-Enter`
- Change workspace `Alt-[1-9]`

## Shutting down or rebooting

You can shutdown by sending `SIGUSR1` to init, or reboot with `SIGINT`:

	doas kill -s USR1 1 # shutdown
	doas kill -s INT 1 # reboot
