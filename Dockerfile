FROM ruby:3.1.2-alpine3.15

ENV BUNDLER_VERSION=2.3.12

WORKDIR /app

COPY Gemfile* floss.gemspec .

RUN bundle check || bundle install

COPY examples/ ~/.config/floss
COPY . .

CMD ["exe/floss"]
