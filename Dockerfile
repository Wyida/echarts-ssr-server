FROM ubuntu:18.04
LABEL maintainer="daoying007 <daoying007@gmail.com>"

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get install -y libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++ node npm ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy xfonts-intl-chinese fonts-arphic-uming fonts-noto

RUN npm install -g pm2
WORKDIR /root/
ADD server.js /root/
ADD package.json /root/
RUN npm install

EXPOSE 80

CMD ["pm2", "start", "/root/server.js", "--no-daemon"]