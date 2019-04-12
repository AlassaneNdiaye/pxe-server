PUBLIC_KEY=$1
SCRIPT=$(
cat <<EOF

%post
mkdir /root/.ssh/
echo ${PUBLIC_KEY} > /root/.ssh/authorized_keys
chmod 0700 /root/.ssh/
chmod 0600 /root/.ssh/authorized_keys
%end
EOF
)
echo "${SCRIPT}" >> /usr/local/apache2/htdocs/ubuntu/16.04/ks.cfg
echo "${SCRIPT}" >> /usr/local/apache2/htdocs/centos/7.6/ks.cfg
