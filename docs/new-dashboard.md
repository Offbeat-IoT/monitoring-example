# Creating your own dashboard


Open grafana in your favorite browser

    http://localhost:3000

The default username/password is _admin/admin_

Navigate to _Dashboards_ and click _New_, then select _New dashboard_


Then click the _Add visualisation_

![Add visualisation](Add%20visualisation.png)


And select the default datasource

![Default datasource](default%20datasource.png)

Then click in the _Select metric_ field and select your metric

![img.png](select%20metric.png)

This example will show the temperature and humidity metrics

![img.png](reactive%20finding%20metrics.png)

You can add label filters to narrow the metric to your specific device

![img.png](narrowing%20the%20focus.png)

Here I added the temperature for my _Inside hydroponic pump_

![img.png](narrowing%20focus.png)

And I set the _Legend_ to be the name of the metric

![img.png](label%20name.png)

And I added a metric for humidity as well

![img.png](humidity.png)

Then, in the _Panel options_, rename the dashboard to _Living room_. If your hydroponics setup is in another room, then use that name. Because everybody has a hydroponics setup, right?

![img.png](Room%20naming.png)

Then save the dashboard, and get back to it
![img.png](back%20to%20dashboard.png)

And you should be able to see your beautiful dashboard

![img.png](Dashboard%20example.png)

To connect the lines, under _Panel Options_ to the right, scroll down to _Connect null values_ and select _Always_

![img.png](Connect_null_values.png)
