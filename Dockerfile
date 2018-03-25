FROM centos

RUN yum -y install bison flex yum-utils git python python-devel openssl-devel libffi-devel wget
RUN yum-builddep -y kernel-*
RUN git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git /opt/linux-next
RUN wget -O /opt/get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN python /opt/get-pip.py
RUN pip install ansible
