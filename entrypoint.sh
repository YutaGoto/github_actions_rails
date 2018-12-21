#!/bin/sh -l

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rspec
