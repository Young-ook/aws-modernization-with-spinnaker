---
title: "AWS 계정 생성"
chapter: false
weight: 13
---

{{% notice warning %}}
계정에는 새 IAM 역할을 생성하고 다른 IAM 권한의 범위를 지정할 수있는 권한이 있어야 합니다.
{{% /notice %}}

1. 관리자 액세스 권한이있는 AWS 계정이 아직없는 경우 : [여기를 클릭하여 지금 생성](https://console.aws.amazon.com/iam/home?#/users$new)

1. AWS 계정이 있으면 AWS 계정에 대한 관리자 액세스 권한이있는 IAM 사용자로서 나머지 워크숍 단계를 따르고 있는지 확인하십시오. : [워크숍에 사용할 새 IAM 사용자 생성](https://console.aws.amazon.com/iam/home?#/users$new)

1. 사용자 세부 정보를 입력합니다.
![사용자 만들기](/images/aws/iam-1-create-user.png)

1. AdministratorAccess IAM 정책을 연결합니다.
![정책 첨부](/images/aws/iam-2-attach-policy.png)

1. 클릭하여 새 사용자를 만듭니다.
![사용자 확인](/images/aws/iam-3-create-user.png)

1. 로그인 URL을 기록하고 다음을 저장합니다.
