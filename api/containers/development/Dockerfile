FROM ruby:3.2.1

ENV LANG C.UTF-8

RUN apt update -qq && \
  apt install -y --no-install-recommends \
  postgresql-client \
  build-essential && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app
