FROM ubuntu:18.04
MAINTAINER Rizwan Javed "rizwan.javed@usepace.com"
ENV SHELL /bin/bash
RUN rm /bin/sh && ln -sf /bin/bash /bin/sh
RUN source ~/.profile
RUN export GPG_TTY=$(tty)
RUN apt-get update
RUN apt --assume-yes install git
RUN apt-get --assume-yes install jq
RUN apt-get --assume-yes install curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get --assume-yes install nodejs
RUN curl -fsSL https://get.pulumi.com | sh
RUN rm /etc/environment
RUN echo 'PATH="$PATH:/root/.pulumi/bin"' >> /etc/environment
WORKDIR /apps
RUN source /etc/environment
ENTRYPOINT tail -f /dev/null
CMD [ "/bin/bash" ]
