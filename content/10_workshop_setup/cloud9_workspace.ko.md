---
title: "Cloud9 통합개발환경 구성"
chapter: false
weight: 14
---

{{% notice warning %}}
Cloud9 작업 환경은 루트 계정 사용자가 아닌 관리자 권한이 있는 IAM 사용자가 구축해야 합니다. 루트 계정 사용자가 아닌 IAM 사용자로 로그인했는지 확인하십시오.
{{% /notice %}}

{{% notice info %}}
이 워크샵은 **Seoul (ap-northeast-2)** 지역에서 실행되도록 설계되었습니다. **다른 지역에서는 실행하지 마십시오.** 이 워크숍의 향후 버전에서는 지역 가용성이 확대되며 이 메시지는 제거됩니다.
{{% /notice %}}

{{% notice tip %}}
Cloud9 도메인에 대해 광고 차단기, 자바 스크립트 비활성화기 및 추적 차단기를 비활성화 해야합니다. 그렇지 않으면 작업 환경에 대한 연결이 영향을 받을 수 있습니다.
Cloud9에는 타사 쿠키가 필요합니다. [특정 도메인](https://docs.aws.amazon.com/cloud9/latest/user-guide/troubleshooting.html#troubleshooting-env-loading)을 화이트리스트에 추가 할 수 있습니다.
{{% /notice %}}

### Cloud9 시작:
[Cloud9 서비스 콘솔](https://ap-northeast-2.console.aws.amazon.com/cloud9/home?region=ap-northeast-2) 에서 Cloud9 환경을 새로 만듭니다.

{{% notice warning %}}
Cloud9 환경의 이름을 *DevOpsWorkshop* 으로 지정합니다.
{{% /notice %}}

**Create environment**를 선택합니다. 이름을 **`DevOpsWorkshop`**으로 지정하고 다른 모든 기본값을 사용합니다. Cloud9이 시작되면 **welcome tab** 및 **lower work area** 을 닫고 기본 작업 환경에서 새 **terminal** 탭을 열어 환경을 사용자 지정합니다.
![c9before](/images/aws/c9-init.png)

이제 작업 환경이 다음과 같아야합니다.
![c9after](/images/aws/c9-terminal.png)

이 테마가 마음에 들면, Cloud9 작업 환경 메뉴에서 **View / Themes / Solarized / Solarized Dark**를 선택하여 직접 선택할 수 있습니다.

## IAM 역할 연결
Cloud9 EC2 인스턴스를 찾으려면 [EC2 서비스 콘솔](https://console.aws.amazon.com/ec2/v2/home?#Instances:tag:Name=aws-cloud9-.*workshop.*;sort=desc:launchTime)을 참고하세요.

인스턴스를 선택한 다음 **Actions / Security / Modify IAM role**을 선택합니다.
![c9instancerole](/images/aws/c9-modify-instance-iam-role.png)

**IAM Role** 드롭 다운에서 **`DevOpsWorkshop-Admin`**을 선택하고 **Save**을 선택합니다.
![c9attachrole](/images/aws/c9-attach-admin-role.png)

작업 환경으로 돌아가서 톱니 바퀴 아이콘(오른쪽 상단 모서리에 있음)을 클릭합니다. **AWS Settings**를 선택하고, **AWS managed temporary credentials** 를 끕니다. 그리고 환경 설정 탭을 닫습니다.
![c9disableiam](/images/aws/c9-setting-disable-iam-role.png)

Cloud9 환경으로 들어가서 다음 명령어를 실행하여 필수 구성 요소를 설치합니다.
```sh
sudo yum -y install jq
```

다음, 아래 명령을 이용해서 현재 Region과 AWS 계정 정보를 환경 변수로 등록합니다. 환경 변수는 이후 실습에서 활용하므로 반드시 확인하고 넘어가야합니다.

```sh
rm -vf ${HOME}/.aws/credentials
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || echo AWS_REGION is not set
aws sts get-caller-identity --query Arn | grep DevOpsWorkshop-Admin -q && echo "IAM role valid" || echo "IAM role NOT valid"
```

출력된 리전 정보가 맞는 지, 그리고 'IAM role valid' 결과가 출력되는 지 확인합니다.

## 실습 예제 받기
다음과 같이 명령을 수행하여 예제를 내려 받기합니다.
```sh
git clone https://github.com/Young-ook/terraform-aws-spinnaker.git
```

준비가 되었다면, 다음으로 진행합니다.

## 필수 구성 요소
실습 예제에서는 테라폼([terraform](https://terraform.io)), 쿠버네티스 컨트롤([kubectl](https://kubernetes.io/docs/reference/kubectl/overview/))과 같은 도구를 사용합니다. 필수 구성 요소를 설치하기 위하여 다음 단계를 진행합니다.
