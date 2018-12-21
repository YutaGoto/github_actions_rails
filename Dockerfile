FROM ruby:2.5.3

LABEL "repository"="https://github.com/YutaGoto/github_actions_rails"
LABEL "homepage"="https://github.com/YutaGoto/github_actions_rails"
LABEL "maintainer"="YutaGoto <you.goto.510@gmail.com>"

ENV LANG C.UTF-8
ENV APP_ENV /app

RUN apt-get update -qq && apt-get install -y build-essential postgresql-client
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

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
