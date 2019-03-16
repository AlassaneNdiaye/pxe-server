#!/bin/bash

IP_ADDRESS=$(hostname --all-ip-addresses | cut -d " " -f 1)

echo "url --url http://${IP_ADDRESS}/ubuntu/" >> /usr/local/apache2/htdocs/ks.cfg

cat <<EOF >> /var/lib/tftpboot/pxelinux.cfg/default
label Install Ubuntu 16.04
        kernel ubuntu-installer/amd64/linux
        append ks=http://${IP_ADDRESS}/ks.cfg vga=normal initrd=ubuntu-installer/amd64/initrd.gz ramdisk_size=16432 root=/dev/rd/0 rw  --"
EOF

cat <<EOF >> /etc/supervisor/supervisord.conf
[program:tftpd]
command=in.tftpd -L -s /var/lib/tftpboot

[program:httpd]
command=httpd-foreground
environment=PATH="/usr/local/apache2/bin:%(ENV_PATH)s"
EOF

exec supervisord --nodaemon
