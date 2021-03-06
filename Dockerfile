FROM gliderlabs/alpine:3.3
RUN \
apk add --no-cache git openssh bash && \
ssh-keygen -A && \
sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config && \
adduser git -D -G root -h /home/git -s /bin/bash && \
passwd -d git && \
su git -c "mkdir /home/git/.ssh && \
ssh-keygen -t rsa -b 4096 -f /home/git/.ssh/id_rsa -P '' && \
mv /home/git/.ssh/id_rsa.pub /home/git/.ssh/authorized_keys && \
mkdir /home/git/test.git && \
git --bare init /home/git/test.git"

VOLUME ["/home/git/.ssh", "/home/git/test.git/hooks"]
WORKDIR /home/git

CMD ["/usr/sbin/sshd", "-D"]
