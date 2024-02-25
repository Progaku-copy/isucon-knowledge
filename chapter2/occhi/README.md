#  Prometheusで監視してみる
## 実際に負荷をかけてみる
### volumeの作成
まずdocker volumeを作成します。
```bash
$ docker volume create metrics_data
```

### コンテナを起動する
```bash
$ docker compose up
```

### 負荷をかける
target_appコンテナ内で以下のコマンドを実行する。
4つのCPUコアに負荷をかける例だと、以下のようなコマンドを実行すれば良い。
```bash
# target_appコンテナのシェルを開く
$ docker exec -it target_app bash

# stressコマンドで負荷をかける
$ stress -c 4
```

Ref: https://zenn.dev/aobaiwaki/articles/a612bf497c59ca

### WIP: Applicationサーバーの起動
(アプリケーションサーバーに負荷をかけたいが、コンテナ内だとruby main.rbでうまくいかない。)
```bash
$ ruby app_server/main.rb
```
Ref: https://github.com/sinatra/sinatra


---

## Prometheusで実行するクエリの例
```
avg without(cpu) (rate(node_cpu_seconds_total{mode!="idle"}[1m]))
```

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
