FROM ruby:3.2.4-alpine3.20

ADD . /home
WORKDIR /home

RUN apk add make gcc g++

RUN bundle update --bundler
RUN bundle config path vendor
RUN bundle install
EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb"]
