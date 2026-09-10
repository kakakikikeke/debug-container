FROM ruby:4.0.5-alpine3.23

COPY . /home
WORKDIR /home

RUN apk --no-cache add make gcc g++ musl-dev linux-headers yaml-dev

RUN gem install bundler
RUN bundle config path vendor
RUN bundle install
EXPOSE 4567

# Ohai requires root privileges to collect system information.
# The application intentionally runs as root.
# nosemgrep: dockerfile.security.missing-user.missing-user
CMD ["bundle", "exec", "ruby", "app.rb"]
