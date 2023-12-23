FROM nginx:1.22

ENV LC_ALL ja_JP.UTF-8

RUN apt-get update && \
    apt-get install -y apt-utils locales && \
    sed -i -e 's/# ja_JP.UTF-8/ja_JP.UTF-8/g' /etc/locale.gen && \
    locale-gen ja_JP.UTF-8

# remove default settings
RUN rm -f /etc/nginx/conf.d/*
RUN rm -f /etc/nginx/nginx.conf

# 初期状態の設定ファイル
ADD ./.docker/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./.docker/nginx/default.conf /etc/nginx/conf.d/default.conf