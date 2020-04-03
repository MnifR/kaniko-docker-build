FROM amazonlinux:latest
RUN echo 'export PS1="[darwinjs/amazonlinux2powershell] \W # "' >> /etc/profile.d/darwinjs.sh

RUN curl -s https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/installpsh-amazonlinux.sh | bash

RUN yum clean all
RUN rm -rf /var/cache/yum
