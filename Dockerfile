FROM ubuntu:trusty
MAINTAINER motrso kga mjkganedi@gmail.com

#prevent dpkg errors
ENV TERM=xterm-256color

#set mirrors to NZ
RUN sed -i "s/https:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list
