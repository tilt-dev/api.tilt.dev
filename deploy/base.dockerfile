FROM ruby:2.6

RUN gem install jekyll bundler

WORKDIR /base/src

ADD ./base/src/Gemfile /base/src/
ADD ./base/src/Gemfile.lock /base/src/
RUN bundle install
