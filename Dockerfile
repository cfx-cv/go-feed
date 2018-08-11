FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /go-feed
WORKDIR /go-feed

COPY Gemfile /go-feed/Gemfile
COPY Gemfile.lock /go-feed/Gemfile.lock
RUN bundle install

COPY . /go-feed
