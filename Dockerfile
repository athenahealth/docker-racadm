FROM oraclelinux:7.1

MAINTAINER Stas Alekseev <stas.alekseev@gmail.com>

RUN yum -y --color=never install \
      wget \
      perl \
    && (wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash) \
    && yum -y --color=never install srvadmin-idracadm7
    && yum -y --color=never autoremove \
      wget \
      perl \
    && yum -y --color=never clean all

ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]
