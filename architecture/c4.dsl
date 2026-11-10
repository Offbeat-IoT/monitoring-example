# C4 model fragment - Offbeat-IoT/monitoring-example
# Consumed by Offbeat-IoT/information/scripts/c4/build.py.

monitoring_example = softwareSystem "Monitoring Example" "Demonstration Docker Compose stack that shows how to monitor Offbeat devices: Prometheus polls the per-device prometheus endpoint of a websocket user, Grafana renders the example dashboard provisioned from this repository, and Alertmanager routes the alerts Prometheus raises. It is an example for customers to copy, not a platform service." {
  tags "runtime"

  prometheus = container "Prometheus" "Polls the Offbeat device metrics endpoints of the configured websocket users, keeps the temperature, humidity, connected and connected_since series, and forwards alerts." "Prometheus (prom/prometheus)"
  grafana = container "Grafana" "Renders the example device dashboard over the Prometheus data source provisioned from this repository." "Grafana (grafana/grafana)"
  alertmanager = container "Alertmanager" "Groups the alerts Prometheus sends and notifies email, chat or a webhook when a sensor measurement is out of limits." "Alertmanager (prom/alertmanager)"

  monitoring_example.grafana -> monitoring_example.prometheus "Queries device metrics for the provisioned dashboard"
  monitoring_example.prometheus -> monitoring_example.alertmanager "Sends firing alerts"
}
