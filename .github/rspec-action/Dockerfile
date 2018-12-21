FROM circleci/ruby:2.5.3-node-browsers

LABEL "com.github.actions.name"="Rspec"
LABEL "com.github.actions.description"="Rspecを実行する"
LABEL "com.github.actions.icon"="check-square"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/YutaGoto/github_actions_rails"
LABEL "homepage"="https://github.com/YutaGoto/github_actions_rails"
LABEL "maintainer"="YutaGoto <you.goto.510@gmail.com>"

ENV LANG C.UTF-8
ENV APP_ENV /app

RUN apt-get update -qq && apt-get install -y build-essential postgresql-client

RUN mkdir $APP_ENV
WORKDIR $APP_ENV
COPY Gemfile ${APP_ROOT}/Gemfile
COPY Gemfile.lock ${APP_ROOT}/Gemfile.lock
RUN bundle install
COPY . $APP_ROOT
