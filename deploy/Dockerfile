FROM api-site-base AS sources

WORKDIR /docs

COPY ./base/src /base/src/
COPY ./docs/Gemfile /docs/Gemfile
COPY ./docs/Gemfile.lock /docs/Gemfile.lock
RUN bundle install
ADD config /config/
ADD docs /docs/

FROM sources AS static-builder
RUN JEKYLL_ENV=production bundle exec jekyll build -d _site

FROM node:22-alpine as search-builder
RUN npm install -g pagefind
WORKDIR /build
COPY --from=static-builder /docs/_site /build
RUN pagefind --site .

FROM scratch AS static
COPY --from=search-builder /build /

FROM sources
ENTRYPOINT ["bundle", "exec", "jekyll", "serve", "--trace", "--config", "_config.yml,_config-dev.yml"]
