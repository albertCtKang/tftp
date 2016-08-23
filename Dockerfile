FROM ubuntu:14.04
MAINTAINER Albert Kang <albertctkang@gmail.com>

##################
##   BUILDING   ##
##################

# Prerequisites
RUN apt-get --quiet --yes update
ENV DEBIAN_FRONTEND noninteractive
RUN ln -s -f /bin/true /usr/bin/chfn

# Versions to use
ENV tftp_path /tftpboot

# Install prerequisites:
RUN apt-get --quiet --yes install tftp tftpd xinetd  

# Add default user and group
RUN mkdir -p ${tftp_path}
# Add rwx privileges to group 
RUN chmod 777 ${tftp_path}
RUN chown nobody:nogroup ${tftp_path}

ADD conf/tftp /etc/xinetd.d/

RUN /etc/init.d/xinetd restart


RUN update-rc.d xinetd defaults

