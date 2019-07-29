FROM alpine

RUN apk add bash \
  git \
  composer \
  php7-dom \
  php7-xml \
  php7-xmlwriter \
  php7-tokenizer \
  py-pip \
  ruby \
  ruby-dev \
  libxml2-dev \
  libxslt-dev \
  build-base

RUN mkdir -p /hiptest-publisher-samples
WORKDIR /hiptest-publisher-samples

COPY . /hiptest-publisher-samples

RUN rm -rf hps/hps-*
RUN CLONE_ALL_USE_HTTP=1 bin/clone-all

RUN gem install --no-ri --no-rdoc bundler:1.17.3 io-console

RUN cd hps/hps-behat && composer install
RUN cd hps/hps-behave && pip install behave
RUN cd hps/hps-python-unittest && python bootstrap.py && bin/buildout
