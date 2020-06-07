# oasis qemu image

To launch in graphics mode:

	./run

To launch in serial mode:

	./run -s

## QEMU monitor

In serial mode, you can switch to the QEMU console monitor with
`Ctrl-a c`. In graphics mode, it is started by default.

## Text editor

Two text editors are available: vis(1), a vi-like text editor, and ed(1).

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

## Rebuilding the system from source

The image comes with the oasis source repository checked out at
`/src/oasis`.

	cd /src/oasis
	# add development packages
	doas git -C / pull --depth=1 --allow-unrelated --no-edit origin devel
	# checkpoint root FS state
	git -C / branch -f oasis master
	# add x86_64-linux-musl toolchain
	doas git -C / pull --depth=1 --allow-unrelated --no-edit toolchain master
	# build
	./setup.lua
	samu commit
	# merge to /
	doas git -C / merge --no-edit

## Shutting down or rebooting

You can shutdown by sending `SIGUSR1` to init, or reboot with `SIGINT`:

	doas kill -s USR1 1 # shutdown
	doas kill -s INT 1 # reboot
