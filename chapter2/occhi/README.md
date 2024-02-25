#  Prometheusで監視してみる
## 実際に負荷をかけてみる
### Applicationサーバーの起動
```bash
$ ruby app_server/main.rb
```
Ref: https://github.com/sinatra/sinatra

### prometheusを起動する
まずdocker volumeを作成します。
```bash
$ docker volume create metrics_data
```

Ref: https://zenn.dev/aobaiwaki/articles/a612bf497c59ca


## Tips. 最小構成でPrometheus/node_exporterを起動する
- どちらもdocker imageが公開されているので、そちらを利用することができます。

### Prometheus
```bash
$ docker run \
    -p 9090:9090 \
    -v ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus
```
Ref: https://hub.docker.com/r/prom/prometheus/

### node_exporter
```bash
$ docker run -d \
    --name node-exporter \
    --net="host" \
    --pid="host" \
    -v "/:/host:ro,rslave" \
    quay.io/prometheus/node-exporter:latest \
    --path.rootfs=/host
```
Ref: https://github.com/prometheus/node_exporter
