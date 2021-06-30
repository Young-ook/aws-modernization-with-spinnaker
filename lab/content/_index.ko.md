---
title: "Well-Architected Containers with DevOps"
chapter: true
weight: 1
---

# Well-Architected Containers with DevOps

### 환영합니다
이 워크샵은 신입 SRE(Site Reliability Engineer)의 입장에서 컨테이터기반의 마이크로서비스 환경을 구축해보는 실습 예제입니다. 복잡한 구조의 서비스를 어떻게 잘 구성하고, 관리할 수 있는 지 살펴 볼 것입니다.

![service-mesh](/images/yelb-service-mesh-architecture.png)

실습 과제에서는 인프라스트럭처 관리를 위하여 테라폼을 사용합니다. 그리고 컨테이터 이미지 생성을 위해서 AWS의 관리형 빌드 도구인 CodeBuild를 활용할 것입니다. 그리고 마이크로서비스는 컨테이너 형태로 배포되며, AWS의 관리형 쿠버네티스 서비스인 EKS (Elastic Kubernetes Service) 위에서 동작합니다. 컨테이너를 배포하기 위한 자동화 도구는 스핀에커(Spinnaker)를 사용해 볼 것입니다. 컨테이너로 동작하는 서비스의 지표를 확인하기 위하여 컨테이너 인사이츠(CloudWatch Container Insights)를 활용할 것입니다. 그리고 각 마이크로 서비스들 사이의 통신을 들여다보기 위하여 AWS 엑스레이(X-ray) 서비스를 활용할 것입니다. 마지막으로 전반적인 서비스의 네트워크 흐름을 제어하기 위하여 서비스 메시 솔루션인 앱 메시(App Mesh)를 활용할 것입니다.

효율적이고 안정적인 서비스 운영을 위한 DevOps 엔지니어 또는 사이트 신뢰성 엔지니어가 될 여정을 시작하겠습니다.