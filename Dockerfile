FROM centos:latest
MAINTAINER major@redhat.com

# Get required RPM packages
RUN yum --quiet --assumeyes install bison flex yum-utils git python \
    python-devel openssl-devel libffi-devel wget
RUN yum-builddep --quiet --assumeyes kernel-*
RUN yum clean all && rum -rf /var/cache/yum/*

# Run playbook
COPY run.sh /run.sh
CMD /bin/bash /run.sh
