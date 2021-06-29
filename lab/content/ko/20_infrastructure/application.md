---
title: "1.2 어플리케이션"
chapter: false
weight: 20
---

## 어플리케이션

어플리케이션(Application) 모듈은 어플리케이션이 실행될 EKS(Elastic Kubernetes Service) 클러스터를 생성합니다. EKS를 배치할 곳은 이전 Foundation 모듈에서 생성한 VPC입니다. 테라폼 소스를 보면 Foundation 모듈에서 생성한 Private Subnet 목록을 Application 모듈의 Container 모듈에 전달하는 것을 확인할 수 있습니다.

그리고, EKS와 함께 사용할 수 있는 유용한 추가 기능들을 설치합니다. 본 실습에서는 테라폼의 Helm 프로바이더를 이용하여 App Mesh Controller, Amazon CloudWatch ContainerInsights Agents, AWS ALB Ingress Controller를 설치합니다.

### 테라폼 준비

먼저 테라폼 수행을 위한 준비를 합니다. 필요한 테라폼 모듈과 프로바이더([provider](https://registry.terraform.io/browse/providers))를 자동으로 내려받습니다. 프로바이더는 클라우드 제공자의 API를 감싸서 만든 것입니다. Foundation 구축 단계에서 이미 수행한 적이 있다면 넘어가도 좋습니다.

```sh
terraform init
```

### 테라폼 실행

```sh
terraform apply -var-file default.tfvars -target module.application
```

명령을 수행하면, AWS 자원을 생성하기 위한 실행 계획이 표시되며, 실제 **반영**할 것인지 확인할 때 *yes* 를 입력해서 다음으로 넘어갑니다.

테라폼 실행 화면에 반영 중인 시간이 표시됩니다. 보통 EKS 클러스터를 만드는 시간이 약 15분 정도 걸립니다.