---
title: "CloudFormation"
chapter: false
weight: 10
---

{{% notice info %}}
본 실습 과제는 **Seoul (ap-northeast-2)** 리전에서 수행하도록 만들었습니다. 따라서, 다른 리전에서 실행할 경우 제대로 동작하지 않을 수 있습니다.
{{% /notice %}}

## CloudFormation으로 실습 환경 구성하기

### EC2 키 페어 생성

먼저, AWS Console에서 리전 선텍 목록을 누른 다음 **ap-northeast-2 (Seoul)**를 선택합니다. 이 워크샵에 사용한 스크립트들은 해당 리전에서 실행되는 것을 확인하였습니다.

![aws-pick-region](/images/aws/aws-pick-region.png)

그리고, EC2 서비스 화면으로 이동합니다. [EC2 Console](https://console.aws.amazon.com/ec2/home) 또는 상단의 **서비스** 메뉴를 눌러서 이동할 수 있습니다.

왼쪽 메뉴 아래에 있는 *키 페어* 를 선택합니다. 우측 상단의 **키 페어 생성**을 눌러서 새로운 키를 생성합니다. 원활한 실습을 위해서 키 이름은 `devops-workshop-keypair` 로 지정합니다. 자신의 환경에 맞게 pem 또는 ppk 파일 선택하여 내려 받습니다. 이 키는 EC2 인스턴스를 접속할 때 사용하므로 잘 보관해 두어야 합니다.

### CloudFormation 스택 생성
다음, 클라우드 포메이션 서비스 화면으로 이동합니다. [CloudFormation Console](https://console.aws.amazon.com/cloudformation/home) 또는 상단의 **서비스** 메뉴를 눌러서 이동할 수 있습니다. 다음과 같이 실습 환경 구성을 위한 클라우드 포메이션 템플릿을 내려 받습니다.

```sh
curl -LO https://raw.githubusercontent.com/Young-ook/aws-modernization-with-spinnaker/main/workspace/workspace.yaml
```

이제 **스택 생성** 목록을 누르고, 새 리소스 사용 (표준)을 눌러서 클라우드 포메이션 생성화면으로 넘어갑니다. 화면이 바뀌면, **준비된 템플릿**, **템플릿 파일 업로드**를 차례대로 선택합니다. 다음, **파일 선택** 단추를 눌러 조금 전에 내려받은 workspace.yaml 파일을 지정합니다. 그리고 *다음* 을 눌러서 다음 단계로 이동합니다.

![cfn-template-upload](/images/aws/cfn-template-upload.png)

**스택 이름**에 `DevOpsWorkshopWorkspace` 를 입력합니다. Key Name은 아까 만들었던 키 페어의 이름을 선택합니다. *다음* 을 눌러서 다음 단계로 이동합니다. **스택 옵션 구성**에서는 특별히 설정할 것은 없습니다. *다음* 을 눌러서 다음 단계로 이동합니다. 화면을 맨 아래로 내리면, **AWS CloudFormation에서 사용자 지정 이름으로 IAM 리소스를 생성할 수 있음을 승인합니다.** 라는 문구의 체크 박스가 있는데, 확인으로 표기합니다. EC2 인스턴스가 사용할 IAM 역할을 클라우드 포메이션 템플릿안에서 만드는 것을 승인하는 절차입니다. *스택 생성* 을 누르면 자원이 생성됩니다.

![cfn-template-iam-capabilities](/images/aws/cfn-stack-iam-capabilities.png)