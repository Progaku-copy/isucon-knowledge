#  Prometheusで監視してみる
## 最小構成でPrometheusを起動する
- docker imageが公開されているので、そちらを利用することができます。

```bash
$ docker run \
    -p 9090:9090 \
    -v ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus
```
Ref: https://hub.docker.com/r/prom/prometheus/
