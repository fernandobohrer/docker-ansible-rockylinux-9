FROM rockylinux:9

LABEL maintainer="Fernando Bohrer"

ENV PIP_PACKAGES "ansible"

RUN yum -y install \
        python3-pip \
        sudo \
        systemd \
    && yum clean all \
    && rm -rf /usr/share/doc \
    && rm -rf /usr/share/man

RUN pip3 install --upgrade pip
RUN pip3 install $PIP_PACKAGES

RUN mkdir -p /etc/ansible
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]

CMD ["/lib/systemd/systemd"]
