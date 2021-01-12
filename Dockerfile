FROM centos:8

RUN yum -y update && \
    yum -y install wget 

WORKDIR /etc/yum.repos.d/
RUN wget https://download.opensuse.org/repositories/isv:ownCloud:desktop/CentOS_8/isv:ownCloud:desktop.repo
RUN yum -y install owncloud-client

ENTRYPOINT /opt/ownCloud/ownCloud/bin/owncloud