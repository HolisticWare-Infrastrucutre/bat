


etc/ssh/sshd_config, and look for ListenAddress. If it’s there, comment it out; then (after you’ve restarted the daemon) it’ll bind to all addresses.
– Next, and far more generically, is the “lsof” command. lsof stands for “LiSt Open Files”. Somewhat counterintutively, however, it will also list what ports, on what interfaces, programs have open. Do an “lsof -i | less” and watch the output. Sample output for sshd on my machine is can be found by:
lsof -i:ssh [Search for open ports, looking for port "ssh" as per /etc/services]
or
lsof -i:22 [Same thing, but, 'cause you're cool (or looking for an esoteric port not in /etc/services), you specify the port number]
or
lsof -i | grep ssh [show all open ports, and let me filter them for my target]
or (for the Hell of it)
lsof -i | egrep -i “ssh|smtp|http” [show all open ports, and let me filter for multiple targets]

Anyway, using option number 1, you get:
root@beorn:/etc/ssh# lsof -i:ssh
COMMAND PID USER FD TYPE DEVICE SIZE NODE NAME
sshd 5623 root 3u IPv6 18060 TCP *:ssh (LISTEN)

The asterisk says “open on all interfaces”. If, instead, it showed (say) “localhost”, then you’d have no external exposure.

In summary, lsof is a tremendously helpful tool, especially for troubleshooting.