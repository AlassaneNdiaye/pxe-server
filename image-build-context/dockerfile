FROM centos as boot-loader-extract-stage

RUN yum -y install syslinux


FROM ubuntu:16.04

RUN apt-get update; apt-get install -y tftpd-hpa

RUN mkdir -p /var/lib/tftpboot/

# add syslinux boot loaders to the TFTP server
COPY --from=boot-loader-extract-stage /usr/share/syslinux/ /var/lib/tftpboot/

# add boot images to the TFTP server
COPY boot-images/ /var/lib/tftpboot/

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
