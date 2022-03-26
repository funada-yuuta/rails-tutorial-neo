# 安定版のruby:2.7.5
FROM ruby:2.7.5

ENV LANG C.UTF-8
# 関数の結果に影響するので、タイムゾーンは設定する
ENV TZ Asia/Tokyo

# yarnの安定版を取得するのに必要な記述
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# default-mysql-clientはmysqlを使うのに必要
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn \
    default-mysql-client \
    imagemagick

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install