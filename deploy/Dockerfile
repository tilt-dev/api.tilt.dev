FROM api-site-base

WORKDIR /docs

RUN mkdir -p /docs
ADD base/src /base/src/
ADD config /config/
ADD docs /docs/
ENTRYPOINT bundle exec jekyll serve --config _config.yml,_config-dev.yml
