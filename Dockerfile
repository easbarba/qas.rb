FROM ruby:3.1.2-alpine3.15
RUN apk --update add git
WORKDIR /app
COPY . ./
RUN bundle install
RUN mkdir -pv /root/.config
COPY examples /root/.config/qas
