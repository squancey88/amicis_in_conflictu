FROM ruby:3.3.0-alpine
RUN apk update
ENV PIP_BREAK_SYSTEM_PACKAGES 1
RUN apk --no-cache add curl build-base postgresql-dev tzdata nodejs chromium chromium-chromedriver python3 python3-dev py3-pip yarn procps bash bash-completion sudo openssh docker git less graphviz libxslt-dev libxml2-dev npm
RUN pip install --upgrade pip
RUN pip3 install -U selenium
RUN yarn global add npx
RUN curl https://cli-assets.heroku.com/install.sh | sh
WORKDIR /app
RUN bundle config set force_ruby_platform true
RUN bundle config build.nokogiri --use-system-libraries
COPY Gemfile Gemfile.lock /app/