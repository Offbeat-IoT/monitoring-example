# Monitor your devices using metrics and see beautiful dashboards in grafana

TLDR; https://prometheus.io/[Prometheus] is an open-source monitoring system with a dimensional data model, flexible query language, efficient time series database and modern alerting approach.

https://prometheus.io/docs/alerting/latest/alertmanager/[Alert manager] Alertmanager handles alerts sent by the Prometheus server.

https://grafana.com/[Grafana] Grafana is the open source analytics & monitoring solution for every database

Combine these tools with https://offbeat-iot.com[Offbeat-IoT] to monitor your devices and see beautiful dashboards using https://www.docker.com/[docker]



### Observe your device through prometheus metrics

Get a better overview of the sensors on your devices by polling metrics and viewing graphs in grafana.

If a sensors measurements is out of limits, then have the alert manager send you an email, chat or call a webhook.


Lets imagine you have a device that measures the temperature and humidity in a room.

If it sends that data to [Offbeat-Iot](https://offbeat-iot.com) over websockets, like so:

    {
      "temperature"=18,
      "humidity":80
     }

Then when you call this endpoint and use the username/password of a websocket user 

    https://offbeat-iot.com/api/devices/<the endpooint id of your device>/prometheus

Then you will see data like this:

    # HELP temperature 
    # TYPE temperature gauge
    temperature{device="friendly name of the device",} 18.0
    # HELP humidity
    # TYPE humidity gauge
    humidity{device="alexa-switch",} 80.0
    # HELP connected Shows if device is connected. 1.0 = true/0.0 = false
    # TYPE connected gauge
    connected{device="friendly name of the device",} 1.0
    # HELP connected_since_total 
    # TYPE connected_since_total counter
    connected_since_total{device="friendly name of the device",} 0.0


We see that two [gauges](https://prometheus.io/docs/concepts/metric_types/#gauge) are created for the measurements.

We also see that two other metrics are shown:
* *connected*
  * This also a gauge, which shows if the device is connected or not
* *connected_since*
  * This is a [counter](https://prometheus.io/docs/concepts/metric_types/#counter) which shows how long the device has been connected with millisecond precision. 

Assuming you have [git](https://git-scm.com/) and [docker](https://www.docker.com/) installed, you can configure prometheus by cloning this repository and running the compose file

    git clone git@github.com:Offbeat-IoT/monitoring-example.git

and then by creating some volumes to store data in the stack

    docker volume create offbeat-iot-prometheus-data
    docker volume create offbeat-iot-grafana-data
    docker volume create offbeat-iot-alertmanager-data

then open _prometheus/data/offbeat-iot-devices.yml_ and add your websocket users username and password at the bottom of the file.

When all this is done, you are ready to start the stack.

    docker compose up -d 

The _-d_ parameter starts the stack as a deamon and you have your hands free in the console

If you open your browser and navigate to

    http://localhost:9090/

you have entered your prometheus instance

and if you then head to _status->targets_ you can see the targets prometheus is polling

If they are not all a delightful blue color, then they probably will be after a few browser refreshes.

If you navigate to the *Graph* and start typing _temperature_ or _humidity_ then you should see the data collected from Offbeat-Iot, from your device.

If you then navigate to 

    http://localhost:3000

You will enter grafana. Where you can log in using admin/admin as user and password. Grafana will as you to set a more secure password.

