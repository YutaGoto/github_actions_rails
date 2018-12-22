FROM ruby:2.5.3

ARG RACK_ENV
ENV LANG C.UTF-8
ENV APP_ENV /app

RUN apt-get update -qq && apt-get install -y build-essential postgresql postgresql-client
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN mkdir $APP_ENV
WORKDIR $APP_ENV
COPY Gemfile ${APP_ROOT}/Gemfile
COPY Gemfile.lock ${APP_ROOT}/Gemfile.lock
RUN bundle install
COPY . $APP_ROOT
