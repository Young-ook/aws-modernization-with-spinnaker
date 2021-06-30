---
title: "3.1 메트릭"
chapter: false
weight: 10
---

## 측정 지표

측정 지표(Metric)는 시스템의 상태를 확인하기 위한 중요한 지표 입니다. 또한 어플리케이션의 성능을 확인하기 위한 중요한 자료가 되기도 합니다. 수 많은 컨테이너의 지표를 수집하고 확인하기 위하여 Amazon CloudWatch Container Insights를 활용할 수 있습니다. 컨테이너가 실행되는 클러스터 노드에 데몬셋으로 실행되어 노드 안에 있는 컨테이너들의 지표와 로그를 Amazon CloudWatch 서비스로 전송합니다. 해당 지표는 통합 환경에서 중앙 집중식으로 관리할 수 있으며, 한 눈에 전체 시스템의 상태와 상황을 파악할 수 있도록 가시성을 제공합니다.

### 대시보드

한 눈에 전체 지표를 확인할 수 있습니다. 각 포드, 컨테이너 별로 프로세서, 메모리, 디스크, 네트워크 사용량이 표시됩니다.

![aws-containerinsights-dashbord](/images/aws/containerinsights-dashboard.png)

### 맵

컨테이너와 서비스의 배포 구성에 대한 지도를 확인할 수 있습니다. 어떤 구성으로 배치 되어 있는 지 전체적인 관점에서 확인할 수 있습니다.

![aws-containerinsights-mapview](/images/aws/containerinsights-mapview.png)