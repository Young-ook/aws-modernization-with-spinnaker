---
title: "Cloud9 IDE 환경 구성"
chapter: false
weight: 13
---

## Cloud9 실습환경 구성하기

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
