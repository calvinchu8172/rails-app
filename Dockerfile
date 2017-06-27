FROM 683422241496.dkr.ecr.us-east-1.amazonaws.com/rails-passenger:latest
MAINTAINER Ecowork

# -------- #
# - ENVs - #
# -------- #

ENV RAILS_ENV production

# ---------------------------- #
# - Rails App Bundle Install - #
# ---------------------------- #
# 1. make rails app directory
# 2. copy project source code
# 3. chown rails app directory files
# 4. change to rails app directory
# 5. process bundle install

RUN su -s /bin/bash -c "mkdir -p /home/app/rails-app" app
COPY . /home/app/rails-app/
RUN chown -R app:app /home/app/rails-app/*
WORKDIR /home/app/rails-app
RUN bundle install --without test development

# -------------------- #
# - Rails App Config - #
# -------------------- #
# 1. make shared config directory
# 2. copy config ymls to shared config directory
# 3. remove config ymls .sample extension
# 4. symbol link shared config to rails app config directory

RUN su -s /bin/bash -c "mkdir -p /home/app/shared/config" app
RUN su -s /bin/bash -c "cp /home/app/rails-app/config/*.sample /home/app/shared/config/" app
RUN su -s /bin/bash -c "rename 's/.sample//' /home/app/shared/config/*.sample" app
RUN su -s /bin/bash -c "ln -sf /home/app/shared/config/*.yml /home/app/rails-app/config" app

# --------------------- #
# - Assets Precompile - #
# --------------------- #

RUN su -s /bin/bash -c "bin/rails assets:precompile" app

CMD bin/init; /sbin/my_init
