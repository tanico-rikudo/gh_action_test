FROM postgres:14

# ロケールとタイムゾーンのインストールと設定
RUN apt-get update && \
    apt-get install -y locales tzdata

# Time Zone
ENV TZ=Asia/Tokyo
