FROM ruby:2.7.1-alpine

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql git vim imagemagick" \
    DEV_PACKAGES="build-base curl-dev" \
    HOME=/myapp \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    DISABLE_SPRING=1

WORKDIR /myapp

COPY Gemfile* ./

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    bundle install -j4 && \
    bundle update -j4  && \
    apk del build-dependencies

COPY . .

CMD [ "/bin/sh", "-c", "set -e \
    && rm -f /myapp/tmp/pids/server.pid \
    && DISABLE_SPRING=1 rails db:migrate \
    && DISABLE_SPRING=1 rails db:seed \
    && DISABLE_SPRING=1 rails s -b '0.0.0.0'" ]