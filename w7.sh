nohup ngrok tcp 5900 -region ap &>/dev/null
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
qemu-system-x86_64 -vnc :0 -hda lite7.qcow2  -smp cores=2  -m 4096M -machine usb=on -device usb-tablet > /dev/null 2>&1
