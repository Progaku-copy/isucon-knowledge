# Ruby 3.2のベースイメージを使用
FROM ruby:3.2

# Node Exporterのバージョンを指定
ENV NODE_EXPORTER_VERSION=1.3.1

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y wget stress

# Node Exporterをダウンロードしてインストール
RUN wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz \
    && tar xvfz node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz \
    && mv node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64/node_exporter /usr/local/bin \
    && rm -rf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64

