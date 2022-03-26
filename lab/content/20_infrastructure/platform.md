---
title: "1.3 플랫폼"
chapter: false
weight: 30
---

## 플랫폼

플랫폼(Platform) 모듈은 어플리케이션의 수명 주기(Lifecycle)을 관리할 데브옵스 환경을 구축합니다. 어플리케이션을 컨테이너 이미지로 만들고 저장소에 보관하기 위한 환경을 구축합니다. AWS CodeBuild는 매니지드 형태의 빌드 도구입니다. AWS CodeBuild를 사용하면, 빌드 도구를 직접 유지/관리할 필요없이 명서서 작성만으로 간편하게 소프트웨어 빌드를 할 수 있습니다. 그리고 ECR(Elastic Container Registry)는 매니지드 형태의 컨테이너 이미지 저장소 입니다. 기본적으로 사용자의 AWS 계정안에서만 접근 가능하기 때문에 안전하게 컨테이너 이미지를 관리할 수 있습니다. 또한 매니지드 서비스 이므로 유지 보수에 대한 부담없이 쉽고 편하게 활용할 수 있습니다. 그리고 스핀에커([spinnaker](https://spinnaker.io))를 구성합니다. 스핀에커는 멀티 클라우드를 지원하는 지속적 전달(Continuous Delivery)도구 입니다. 파이프라인을 생성하여 소프트웨어 빌드, 검증, 배포를 자동화할 수 있으며, 외부 시스템과의 연동을 통하여 기능을 확장할 수 있습니다. 그리고 인스턴스, 또는 컨테이너를 시각적으로 표시하여 직관적으로 현재 서비스의 상태를 파악할 수 있습니다. 또한 클러스터 관리 UI를 통하여 쉽고 빠르게 제어할 수 있습니다.

{{% notice info %}}
본 실습예제에서 Spinnaker를 생성할 때 사용한 코드의 자세한 내용은 [terraform-aws-spinnaker](https://github.com/Young-ook/terraform-aws-spinnaker) 저장소에 있습니다.
{{% /notice %}}

### 테라폼 준비

먼저 테라폼 수행을 위한 준비를 합니다. 필요한 테라폼 모듈과 프로바이더([provider](https://registry.terraform.io/browse/providers))를 자동으로 내려받습니다. 프로바이더는 클라우드 제공자의 API를 감싸서 만든 것입니다. Foundation 구축 단계에서 이미 수행한 적이 있다면 넘어가도 좋습니다.

```sh
cd ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/
```
```sh
terraform init
```

### 테라폼 실행

```sh
terraform apply -target module.platform
```

명령을 수행하면, AWS 자원을 생성하기 위한 실행 계획이 표시되며, 실제 **반영**할 것인지 확인할 때 *yes* 를 입력해서 다음으로 넘어갑니다.

테라폼 실행 화면에 반영 중인 시간이 표시됩니다. 스핀에커도 별도의 EKS 클러스터를 사용합니다. 따라서 이전 단계와 마찬가지로 대략 테라폼 반영 시간이 약 15-20분 정도 걸립니다.
