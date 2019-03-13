FROM ubuntu:trusty
MAINTAINER motrso kga mjkganedi@gmail.com

#prevent dpkg errors
ENV TERM=xterm-256color

#set mirrors to NZ
RUN sed -i "s/https:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list

# install python runtime
RUN apt-get update && apt-get install -y \
    -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    python python-virtualenv

# create virtual env 
#upgrade pip in virtual env to latest version
RUN virtualenv /appenv && \
    . /appenv/bin/activate && \
    pip install pip --upgrade

#add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
