FROM ruby:3.1.2

WORKDIR /app

RUN apt-get update && apt-get install vim -y

COPY Gemfile* /app/

RUN gem install bundler:$(grep "BUNDLED WITH" Gemfile.lock -A 1 | tail -1 | xargs) && \
    bundle install

EXPOSE 9292

CMD bundle exec rackup --host 0.0.0.0
