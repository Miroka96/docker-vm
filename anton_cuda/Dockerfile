FROM nvidia/cuda:10.0-devel
MAINTAINER Mirko Krause krause@codebase.one

RUN apt-get update && apt-get install -y \
openssh-server \
gdb \
rsync \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir /run/sshd

EXPOSE 22

RUN echo "export PATH=$PATH:/usr/local/cuda/bin" >> /etc/profile && \
echo "ldconfig" >> /etc/profile

VOLUME ["/data"]

RUN mkdir /root/.ssh \
&& chmod 700 /root/.ssh
ADD authorized_keys /root/.ssh/
RUN chmod 400 /root/.ssh/authorized_keys

# Run SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
