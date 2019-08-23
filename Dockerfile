FROM ruby:2.5.1
LABEL maintainer=services@trimagency.com

RUN apt-get update && apt-get install -y \
  build-essential \
  locales \
  nodejs \
  graphviz

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 3000

CMD ["rm", "-f", "tmp/pids/server.pid", "&&", "bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
