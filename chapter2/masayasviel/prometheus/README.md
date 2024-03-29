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

- コンテナへの出入り

```sh
# in
docker-compose exec node-exporter sh
# out
exit
```

## アクセス

`http://localhost:9090/`

## グラフ表示

```
node_cpu_seconds_total{job="node"}
avg without(cpu) (rate(node_cpu_seconds_total{model!="idle"}[1m]))
```

## 負荷をかける

```sh
# in
docker-compose exec node-exporter sh
# alt stress
yes > /dev/null
# out
exit
```

## 参考

- [Monitoring a Linux host with Prometheus, Node Exporter, and Docker Compose](https://grafana.com/docs/grafana-cloud/send-data/metrics/metrics-prometheus/prometheus-config-examples/docker-compose-linux/)
- [Linuxで手軽にCPU/メモリの負荷をかける方法](https://qiita.com/keita0322/items/8fba88debe66fa8d2b39)
