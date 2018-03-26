FROM centos:latest
MAINTAINER major@redhat.com

# Get required RPM packages
RUN yum --quiet --assumeyes install bison flex yum-utils git python \
    python-devel openssl-devel libffi-devel wget
RUN yum-builddep -y kernel-*

# Retrieve the kernel source
RUN git clone --quiet --depth 50 \
    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git \
    /opt/linux-next

# Install Ansible
RUN wget --quiet --output-document=/opt/get-pip.py \
    https://bootstrap.pypa.io/get-pip.py
RUN python /opt/get-pip.py
RUN pip install ansible

# Copy in ansible playbook (this should come from git later)
RUN mkdir /opt/ansible/
ADD ansible/hosts.txt /opt/ansible/
ADD ansible/playbook.yml /opt/ansible/

# Run playbook
CMD ansible-playbook -i /opt/ansible/hosts.txt /opt/ansible/playbook.yml
