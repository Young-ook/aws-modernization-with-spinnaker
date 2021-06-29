---
title: "1.1 파운데이션"
chapter: false
weight: 10
---

## 파운데이션

파운데이션(Foundation) 모듈은 어플리케이션이 실행될 환경인 VPC를 생성합니다. VPC는 인터넷에 연결되어 있는 Public Subnet과 인터넷과 격리되어 있는 Private Subnet으로 이루어집니다. Private Subnet은 NAT (Network Address Translation)을 통해서 인터넷과 통신할 수 있습니다. 그리고 Private Subnet은 VPC 엔드포인트와 연결되어 있습니다. Private Subnet에 위치한 인스턴스들은 VPC 엔드포인트를 통하여 외부 통신 없이 AWS의 서비스룰 호출할 수 있습니다.

### 테라폼 준비

먼저 테라폼 수행을 위한 준비를 합니다. 필요한 테라폼 모듈과 프로바이더([provider](https://registry.terraform.io/browse/providers))를 자동으로 내려받습니다. 프로바이더는 클라우드 제공자의 API를 감싸서 만든 것입니다.

```sh
terraform init
```

### 테라폼 실행

```sh
terraform apply -var-file default.tfvars -target module.foundation
```

명령을 수행하면, AWS 자원을 생성하기 위한 실행 계획이 표시됩니다. 테라폼 코드를 바탕으로 어떠한 자원을 생성할 지, 몇 개를 만들 지 등을 미리 보기 할 수 있습니다. 마지막으로 실제 **반영**할 것인지 확인하는 절차가 나오며, *yes* 를 입력해서 다음으로 넘어갑니다.

<pre>
 # module.application.module.container.module.frigga.random_string.suffix will be created
  + resource "random_string" "suffix" {
      + id          = (known after apply)
      + length      = 5
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = false
      + result      = (known after apply)
      + special     = false
      + upper       = false
    }

  # module.foundation.module.vpc.module.frigga.random_string.suffix will be created
  + resource "random_string" "suffix" {
      + id          = (known after apply)
      + length      = 5
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = false
      + result      = (known after apply)
      + special     = false
      + upper       = false
    }

Plan: 41 to add, 0 to change, 0 to destroy.


Warning: Resource targeting is in effect

You are creating a plan with the -target option, which means that the result
of this plan may not represent all of the changes requested by the current
configuration.

The -target option is not for routine use, and is provided only for
exceptional situations such as recovering from errors or mistakes, or when
Terraform specifically suggests to use it as part of an error message.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
</pre>

{{% notice tip %}}
실행 계획을 확인하는 단계를 건너뛰려면 `--auto-approve` 옵션을 추가하면 됩니다. 다만, 실제 운영환경에 적용할 때는 주의해야합니다. 리뷰 과정을 거치지않고 즉각 반영하는 것은 위험하므로 조심해야 합니다.
{{% /notice %}}

다음과 같이 실행 상황을 볼 수 있습니다.

<pre>
module.application.module.container.module.eks.random_string.eks-suffix: Creating...
module.frigga.random_string.suffix: Creating...
module.application.module.container.module.frigga.random_string.suffix: Creating...
module.foundation.module.vpc.module.frigga.random_string.suffix: Creating...
module.application.module.container.module.eks.random_string.eks-suffix: Creation complete after 0s [id=brainidgllor]
module.application.module.container.module.frigga.random_string.suffix: Creation complete after 0s [id=ruqym]
module.frigga.random_string.suffix: Creation complete after 0s [id=xrymv]
module.foundation.module.vpc.module.frigga.random_string.suffix: Creation complete after 0s [id=sorpe]
module.foundation.module.vpc.aws_eip.ngw["ap-northeast-2a"]: Creating...
module.foundation.module.vpc.aws_vpc.vpc: Creating...
module.foundation.module.vpc.aws_eip.ngw["ap-northeast-2a"]: Creation complete after 0s [id=eipalloc-06ec7daac6ed04a59]
module.foundation.module.vpc.aws_vpc.vpc: Still creating... [10s elapsed]
module.foundation.module.vpc.aws_vpc.vpc: Creation complete after 11s [id=vpc-00dd9e53cfe115b5a]
module.foundation.module.vpc.aws_security_group.vpce: Creating...
module.foundation.module.vpc.aws_internet_gateway.igw: Creating...
module.foundation.module.vpc.aws_route_table.public: Creating...
module.foundation.module.vpc.aws_route_table.private["ap-northeast-2a"]: Creating...
module.foundation.module.vpc.aws_subnet.public["ap-northeast-2c"]: Creating...
module.foundation.module.vpc.aws_subnet.public["ap-northeast-2b"]: Creating...
module.foundation.module.vpc.aws_subnet.private["ap-northeast-2a"]: Creating...
module.foundation.module.vpc.aws_subnet.private["ap-northeast-2c"]: Creating...
module.foundation.module.vpc.aws_subnet.private["ap-northeast-2b"]: Creating...
module.foundation.module.vpc.aws_subnet.public["ap-northeast-2a"]: Creating...
module.foundation.module.vpc.aws_route_table.private["ap-northeast-2a"]: Creation complete after 0s
</pre>