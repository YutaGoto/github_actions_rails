FROM ruby:2.5.3

LABEL "repository"="https://github.com/YutaGoto/github_actions_rails"
LABEL "homepage"="https://github.com/YutaGoto/github_actions_rails"
LABEL "maintainer"="YutaGoto <you.goto.510@gmail.com>"

ENV LANG C.UTF-8
ENV APP_ENV /app

RUN apt-get update -qq && apt-get install -y build-essential postgresql-client
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash

RUN mkdir $APP_ENV
WORKDIR $APP_ENV
COPY Gemfile ${APP_ROOT}/Gemfile
COPY Gemfile.lock ${APP_ROOT}/Gemfile.lock
RUN bundle install
COPY . $APP_ROOT

RUN bundle exec rails db:create
RUN bundle exec rails db:schema:load
RUN bundle exec rspec --format progress
