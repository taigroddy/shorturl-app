FROM bitnami/ruby:2.7.2

ENV BUNDLE_PATH='./vendor/bundle'

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_15.x  | bash -
RUN apt-get -y install nodejs
RUN npm install -g yarn
RUN gem install rails

WORKDIR /app

COPY . /app

RUN yarn install --check-files

RUN bundle install

EXPOSE 3000