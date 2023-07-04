FROM centos:8

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y update && \
    yum -y install wget 

WORKDIR /etc/yum.repos.d/
RUN wget https://download.opensuse.org/repositories/isv:ownCloud:desktop/CentOS_8/isv:ownCloud:desktop.repo
RUN yum -y install owncloud-client

ENTRYPOINT /opt/ownCloud/ownCloud/bin/owncloud
