FROM alpine

RUN apk add bash \
  curl \
  git \
  composer \
  maven \
  npm \
  openjdk8 \
  php7-dom \
  php7-xml \
  php7-xmlwriter \
  php7-tokenizer \
  py-pip \
  ruby \
  ruby-dev \
  libxml2-dev \
  libxslt-dev \
  build-base \
  xvfb \
  chromium-chromedriver

# io-console is needed to get hiptest-publisher running
RUN gem install --no-ri --no-rdoc bundler:1.17.3 io-console

# PhantomJS: https://gist.github.com/vovimayhem/6437c2f03b654e392ccf3e9903eba6af
RUN cd /tmp && curl -Ls https://github.com/dustinblackman/phantomized/releases/download/2.1.1/dockerized-phantomjs.tar.gz | tar xz &&\
    cp -R lib lib64 / &&\
    cp -R usr/lib/x86_64-linux-gnu /usr/lib &&\
    cp -R usr/share /usr/share &&\
    cp -R etc/fonts /etc &&\
    curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar -jxf - &&\
    cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

RUN mkdir -p /hiptest-publisher-samples
WORKDIR /hiptest-publisher-samples

COPY . /hiptest-publisher-samples

RUN rm -rf hps/hps-*
RUN CLONE_ALL_USE_HTTP=1 bin/clone-all
RUN cd hps && make install_prerequisites
