FROM ruby:3.1.2-alpine3.15

ENV BUNDLER_VERSION=2.3.12

WORKDIR /app

COPY Gemfile* floss.gemspec ./

RUN apk add git
RUN bundle install
RUN mkdir -pv /root/.config

COPY examples /root/.config/floss
COPY . .

CMD ["exe/floss"]
