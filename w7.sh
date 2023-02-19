./ngrok tcp 20 -region ap &>/dev/null &
sleep 2
qemu-system-x86_64 -vnc :0 -hda lite7.qcow2  -smp cores=1  -m 1024M -machine usb=on -device usb-tablet &>/dev/null &
echo ================================
echo                                 
echo                                 
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo                                 
echo                                 
echo ================================
