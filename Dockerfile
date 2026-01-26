FROM ruby:4.0.1-alpine3.23

ADD . /home
WORKDIR /home

RUN apk add make gcc g++ musl-dev linux-headers

RUN gem install bundler
RUN bundle config path vendor
RUN bundle install
EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb"]
