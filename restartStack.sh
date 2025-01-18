docker compose down

echo "------ Removing volumes ------- "
docker volume rm offbeat-iot-prometheus-data
docker volume rm offbeat-iot-grafana-data
docker volume rm offbeat-iot-alertmanager-data
echo "------ Creating volumes ------- "
docker volume create offbeat-iot-prometheus-data
docker volume create offbeat-iot-grafana-data
docker volume create offbeat-iot-alertmanager-data
echo "------ Starting containers ---- "
docker compose up -d