FROM api-site-base

WORKDIR /docs

COPY ./base/src /base/src/

COPY ./docs/Gemfile /docs/Gemfile
COPY ./docs/Gemfile.lock /docs/Gemfile.lock
RUN bundle install

ADD config /config/
ADD docs /docs/
ENTRYPOINT bundle exec jekyll serve --config _config.yml,_config-dev.yml
