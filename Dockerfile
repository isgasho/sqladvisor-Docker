FROM centos:7

MAINTAINER yulo <uyy2244@gmail.com>

RUN yum install gcc gcc-c++ cmake make git libaio-devel libffi-devel glib2 glib2-devel -y \
    && yum install http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm -y \
    && yum update -y \
    && yum install Percona-Server-shared-56 -y \
    && git clone https://github.com/Meituan-Dianping/SQLAdvisor.git

WORKDIR /SQLAdvisor

RUN  cmake -DBUILD_CONFIG=mysql_release -DCMAKE_BUILD_TYPE=debug -DCMAKE_INSTALL_PREFIX=/usr/local/sqlparser ./ \
     && make \
     && make install


WORKDIR /SQLAdvisor/sqladvisor

RUN  cmake -DCMAKE_BUILD_TYPE=debug ./ \
     && make \
     && ln -s /SQLAdvisor/sqladvisor/sqladvisor /bin/sqladvisor

ENTRYPOINT  ["sqladvisor"]





