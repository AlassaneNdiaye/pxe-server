#!/bin/bash

mkdir -p /var/lib/tftpboot/pxelinux.cfg
cp /conf/menu /var/lib/tftpboot/pxelinux.cfg/default

exec in.tftpd -L -s /var/lib/tftpboot
