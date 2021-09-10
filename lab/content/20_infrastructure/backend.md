---
title: "1.1 테라폼 백엔드"
chapter: false
weight: 10
---

## 테라폼 백엔드(Backend)

테라폼 백엔드는 테라폼을 이용하여 만든 자원의 상태를 보관하고 관리합니다. 아무설정이 없다면 테라폼 작업을 수행하는 같은 공안에 파일로 존재합니다. 이러한 형태를 local 백엔드라고 부릅니다. 이 로컬 백엔드는 현재 자원의 최신 상태를 관리하고 공유하기에 불편합니다. 그래서 S3와 DynamoDB를 활용하여 공동작업을 지원할 수 있고, 생성한 자원의 상태를 높은 수준의 안정성을 가진 저장소에 보관하는 백엔드를 사용할 수 있습니다. 테라폼으로 생성한 자원의 상태를 안전하게 보관하는 것은 공동작업을 위한 동시성 문제와 갑작스런 사고로 인하여 테라폼으로 관리중인 자원이 어떤 것인지 알 수 없게되는 문제를 극복할 수 있습니다.

### 테라폼 준비

먼저 테라폼 수행을 위한 준비를 합니다. 필요한 테라폼 모듈과 프로바이더([provider](https://registry.terraform.io/browse/providers))를 자동으로 내려받습니다. 프로바이더는 클라우드 제공자의 API를 감싸서 만든 것입니다.

```sh
cd ~/environment/aws-modernization-with-spinnaker/terraform/backend
terraform init
```

### 테라폼 실행

```sh
terraform apply
```

명령을 수행하면, AWS 자원을 생성하기 위한 실행 계획이 표시됩니다. 테라폼 코드를 바탕으로 어떠한 자원을 생성할 지, 몇 개를 만들 지 등을 미리 보기 할 수 있습니다. 마지막으로 실제 **반영**할 것인지 확인하는 절차가 나오며, *yes* 를 입력해서 다음으로 넘어갑니다.

### 테라폼 백엔드 설정 복사

테라폼 백엔드를 만드는 작업을 완료하면 같은 디렉토리에 테라폼 백엔드를 지정하는 코드가 생성됩니다. 파일을 열어서 보면 아래와 비슷한 형식으로 되어 있습니다. 테라폼 작업 상태를 보관할 S3 버켓의 이름이 자동으로 들어가 있습니다. 해당 버켓은 테라폼으로 생성하였으며, 이름의 맨 마지막에 임의의 문자를 붙여서 중복을 회피 하도록 설계 하였습니다. 자세한 내용은 [terraform-aws-tfstate-backend](https://github.com/Young-ook/terraform-aws-tfstate-backend) 저장소에 있습니다.

```sh
terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "hello-tfstate-gyyqc"
    key    = "state"
  }
}
```

이 파일을 실습에서 사용할 수 있도록 옮겨 줍니다.

```sh
mv backend.tf ~/environment/aws-modernization-with-spinnaker/terraform/
cd ~/environment/aws-modernization-with-spinnaker/terraform/
```

이제 안전하게 인프라스트럭처를 구성할 준비가 되었습니다. 다음 단계로 이동하여 인프라스트럭처를 생성을 시작합니다.
