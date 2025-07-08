FROM ruby:3.4.4-alpine3.21

ADD . /home
WORKDIR /home

RUN apk add make gcc g++ musl-dev linux-headers

RUN gem install bundler
RUN bundle config path vendor
RUN bundle install
EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb"]
