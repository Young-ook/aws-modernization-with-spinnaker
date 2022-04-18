---
title: "Trace"
chapter: false
weight: 30
---

## Tracing
In a distributed application environment, tracing is required to gain visibility into the communication between each service. Configuring a microservices architecture gives you flexibility for software changes, but it's not easy to see the communication between each microservice. When multiple containers are running and problems occur when each container communicates, log analysis alone is difficult to determine the cause. This requires understanding how each service communicated with whom in what order and how. AWS X-Ray is a service that provides traceability for application analysis in such complex distributed environment configurations. This is a service that allows you to know what content each service or container exchanged and the response time during communication.

### Map
You can visualize the communication topology of distributed systems.

![aws-tracing-servicemap](/images/aws/tracing-servicemap.png)

### Response Time Analysis
You can use tracking services to measure service-wide response times and identify bottlenecks in distributed systems.

![aws-tracing-response-p95](/images/aws/tracing-response-p95.png)

![aws-tracing-timeline](/images/aws/tracing-timeline.png)