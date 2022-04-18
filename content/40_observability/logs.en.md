---
title: "Logs"
chapter: false
weight: 20
---

## Logs
A log is a record left while the system and application are operating. This information is useful to see how your system and applications behaved. You can use Amazon CloudWatch Container Insights to collect and analyze logs from thousands of containers. It runs as a daemonset on the cluster node where the container is running, and sends metrics and logs of containers in the node to the Amazon CloudWatch service. Those metrics can be centrally managed in an integrated environment. The Logs Insights service provides the ability to analyze information in logs in near real time.

### View Logs
You can still check the logs coming from the container. Instead of accessing the inside of the system and checking the log, you can view the log easily and conveniently from the central location.

![aws-containerinsights-logs](/images/aws/containerinsights-logs.png)

### Log Analysis
You can analyze the log by running a query. It can also be used to determine the cause of application behavior, such as the frequency of certain errors over a period of time.

![aws-containerinsights-logs-insights](/images/aws/containerinsights-logs-insights.png)