FROM ruby:3.1.2

ADD . /home
WORKDIR /home

RUN bundle update --bundler
RUN bundle config path vendor
RUN bundle install
EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb"]
