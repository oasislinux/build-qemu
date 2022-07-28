echo "

Booting oasis qemu image...

Tips:
- The root password is empty.
- A regular user 'oasis' is available, also with empty password.
- To run commands as root, use doas(1)
- Text editors available are vis(1) and ed(1)
- To launch velox, run 'swc-launch velox'.
  * To launch st from velox, use Alt-Shift-Enter
  * To launch netsurf from velox, use Alt-b
  * To launch dmenu from velox, use Alt-r
- To shutdown, run 'doas kill -s USR1 1'.
- To kill qemu and oasis, type 'q' into the qemu monitor.



See README.md for more information.

"


$append="init=/bin/sinit root=/dev/vda ro console=hvc0"
$stdio='stdio,id=stdio'

qemu-system-x86_64 -m 2048 `
                   -kernel bzImage `
                   -append "$append" `
                   -device virtio-balloon `
                   -device virtio-rng `
                   -device virtio-keyboard `
                   -device virtio-vga `
                   -device virtio-tablet `
                   -drive file=root.qcow2,media=disk,if=virtio `
                   -nic user,model=virtio `
                   -chardev "$stdio" `
                   -mon chardev=stdio 
echo "\nThanks for trying out oasis!"
