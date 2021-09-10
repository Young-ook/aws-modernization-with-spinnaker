---
title: "Cloud9 IDE 환경"
chapter: false
weight: 11
---

## Cloud9 실습 환경 구성 하기

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
git clone https://github.com/Young-ook/aws-modernization-with-spinnaker.git
```

다음, **terraform** 디렉토리로 이동합니다.
```sh
cd aws-modernization-with-spinnaker/terraform
```

준비가 되었다면, 다음으로 진행합니다.