# Prometheus docker setting

## コマンド

- 実行

```sh
docker-compose up
```

- 終了

```sh
[ctrl] + [C]
```

- ボリュームの削除

```sh
docker-compose down -v
```

- イメージ削除

```sh
docker images -qa | xargs docker rmi
```

## アクセス

`http://localhost:9090/`

## グラフ表示

```
node_cpu_seconds_total{job="node"}
```

## 参考

- [Monitoring a Linux host with Prometheus, Node Exporter, and Docker Compose](https://grafana.com/docs/grafana-cloud/send-data/metrics/metrics-prometheus/prometheus-config-examples/docker-compose-linux/)