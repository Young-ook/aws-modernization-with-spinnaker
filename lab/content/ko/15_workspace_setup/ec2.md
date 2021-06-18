---
title: "EC2 Linux Workspace"
chapter: false
weight: 19
---

## EC2 리눅스 실습 환경 구성 하기

클라우드 포메이션 스택 생성이 성공하면 EC2 인스턴스가 생깁니다. 인스턴스 ID를 눌러서 EC2 서비스 화면으로 이동합니다. 클라우드 포메이션으로 만든 EC2 인스턴스를 선택하고 화면 상단에 *연결* 을 누릅니다. 여러 탭 중에서 *SSH 클라이언트* 를 선택합니다. 화면의 안내에 따라 EC2 인스턴스에 접속합니다.

접속 후 아래와 같은 내용의 스크립트를 작성하고 실행해서 실습 환경을 점검합니다.

```sh
sudo yum -y install jq
rm -vf ${HOME}/.aws/credentials
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || echo AWS_REGION is not set
aws sts get-caller-identity --query Arn | grep DevOpsWorkshopAdmin -q && echo "IAM role valid" || echo "IAM role NOT valid"
```

출력된 리전 정보가 맞는 지, 그리고 'IAM role valid' 결과과 출력되는 지 확인합니다.

## 실습 예제 받기

다음과 같이 명령을 수행하여 예제를 내려 받기합니다.
```sh
git clone https://github.com/Young-ook/aws-modernization-with-spinnaker.git
```

다음, **terraform** 디렉토리로 이동합니다.
```sh
cd aws-modernization-with-spinnaker/terraform
```

준비가 되었다면, [**필수 도구 설치**](/20_prerequisites.html)단계로 이동해서 실습 환경 설정을 계속 진행합니다.