FROM ubuntu:18.04
LABEL maintainer="daoying007 <daoying007@gmail.com>"

RUN apt-get update
RUN apt-get install -y supervisor libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++ npm

WORKDIR /root/
ADD server.js /root/
ADD package.json /root/
RUN npm install

ADD etc/supervisor /etc/supervisor/

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]