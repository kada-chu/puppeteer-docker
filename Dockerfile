FROM node:14-slim

RUN apt-get update
RUN apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-freefont-ttf libxss1 sudo imagemagick \
    && apt-get install ttf-* unzip -y \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*


RUN yarn add puppeteer && yarn add puppeteer-extra && yarn add puppeteer-extra-plugin-proxy && yarn add image-size && yarn add minimist && yarn add request && yarn add puppeteer-extra-plugin-stealth && yarn add puppeteer-extra-plugin-adblocker && yarn add sharp && yarn add aws-sdk && yarn add cheerio

ENV LANG="C.UTF-8"

RUN useradd -ms /bin/bash worker
USER worker
WORKDIR /app


CMD ['/bin/sh']
