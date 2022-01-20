FROM ruby:2.5.5-alpine

ENV BUNDLER_VERSION=2.2.30

RUN apk add --update --virtual \
  runtime-deps \
  postgresql-client \
  build-base \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  openssl \
  yarn \
  libffi-dev \
  readline \
  postgresql-dev \
  sqlite-dev \
  libc-dev \
  linux-headers \
  readline-dev \
  file \
  imagemagick \
  git \
  tzdata \
  less \
  make \
  g++ \
  gcc \
  curl \
  && rm -rf /var/cache/apk/*

RUN gem install bundler -v 2.2.30

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY . /app/

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
