FROM postgres:17

# Set up Japanese locale and timezone
RUN apt-get update \
    && apt-get install -y locales tzdata \
    && localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

# Added a harmless label for CI demo
LABEL maintainer="jaden@example.com"