---
title: "Metric"
chapter: false
weight: 10
---

## Metrics
Metric is an important indicator to check the status of the system. It is also an important indicator to check the performance of the application. You can use Amazon CloudWatch Container Insights to collect and view metrics for thousands of containers. It runs as a daemonset on the cluster node where the container is running, and sends metrics and logs of containers in the node to the Amazon CloudWatch service. These metrics can be centrally managed in an integrated environment, providing visibility into the health and status of the entire system at a glance.

### Dashboard
You can see all metrics at a glance. Processor, memory, disk, and network usage are displayed for each pod and container on the Amazon CloudWatch Container Insights dashboard.

![aws-containerinsights-dashbord](/images/aws/containerinsights-dashboard.png)

### Map
You can see a map of the deployment configuration of containers and services. You can see the overall view of how it is laid out.

![aws-containerinsights-mapview](/images/aws/containerinsights-mapview.png)