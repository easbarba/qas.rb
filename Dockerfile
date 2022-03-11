FROM ruby:3.1.1-alpine3.15

ENV BUNDLER_VERSION=2.3.9

WORKDIR /usr/src/app/

COPY Gemfile*  floss.gemspec .

RUN gem install bundler -v $BUNDLER_VERSION  && bundle install

COPY docs/examples/ /root/.config/floss
COPY . .

CMD ["exe/floss"]
