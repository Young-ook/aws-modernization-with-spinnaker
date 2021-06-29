---
title: "3.2 로그"
chapter: false
weight: 20
---

## 로그

로그(Log)는 시스템과 어플리케이션이 동작하면서 남기는 흔적입니다. 이 정보는 어떻게 시스템과 어플리케이션이 동작했는 지 확인하는 데 유용합니다. 수 많은 컨테이너의 로그를 수집하고 분석하기 위하여 Amazon CloudWatch Container Insights를 활용할 수 있습니다. 컨테이너가 실행되는 클러스터 노드에 데몬셋으로 실행되어 노드 안에 있는 컨테이너들의 지표와 로그를 Amazon CloudWatch 서비스로 전송합니다. 해당 지표는 통합 환경에서 중앙 집중식으로 관리할 수 있습니다. Logs Insights 서비스는 거의 실시간으로 로그의 정보를 분석할 수 있는 기능을 제공합니다.

### 로그 확인

컨테이너로부터 오는 로그를 계속해서 확인할 수 있습니다. 시스템 내부에 접속해서 로그를 확인하는 대시 중앙에서 쉽고 간편하게 로그를 볼 수 있습니다.

![aws-containerinsights-logs](/images/aws/containerinsights-logs.png)

### 로그 분석

쿼리를 실행하여 로그를 분석할 수 있습니다. 특정 오류의 빈도를 확인하는 등, 어플리케이션 동작에 대한 원인 파악을 위해서 사용할 수도 있습니다.

![aws-containerinsights-logs-insights](/images/aws/containerinsights-logs-insights.png)