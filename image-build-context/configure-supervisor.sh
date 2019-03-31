#!/bin/bash
cat <<EOF >> /etc/supervisor/supervisord.conf
[program:tftpd]
command=in.tftpd -L -s /var/lib/tftpboot

[program:httpd]
command=httpd-foreground
environment=PATH="/usr/local/apache2/bin:%(ENV_PATH)s"
EOF
