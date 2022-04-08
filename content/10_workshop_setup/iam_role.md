---
title: "IAM 역할 생성"
chapter: false
weight: 14
---

## 작업 환경에 대한 IAM 역할 생성
{{% notice info %}}
여기부터 아래와 같이 입력할 명령어가 보이면 Cloud9 IDE에 입력합니다. **Copy to clipboard** 기능 (오른쪽 상단 모서리)을 사용하여 Cloud9에 간단히 복사하여 붙여 넣을 수 있습니다. 붙여 넣으려면 Windows의 경우 Ctrl + V를, Mac의 경우 Command + V를 사용할 수 있습니다.
{{% /notice %}}

1. [관리자 액세스 권한이 있는 IAM 역할을 생성하려면 이 링크](https://console.aws.amazon.com/iam/home#/roles$new?step=review&commonUseCase=EC2%2BEC2&selectedUseCase=EC2&policies=arn:aws:iam::aws:policy%2FAdministratorAccess)를 따르십시오.
1. **AWS service** 및 **EC2**가 선택되었는지 확인한 후 **Next**를 클릭하여 권한을 확인합니다.
1. **`AdministratorAccess`**가 선택되었는지 확인하고 **Next**를 클릭하여 검토합니다.
1. 이름으로 **`DevOpsWorkshop-Admin`**을 입력하고 **Create Role**를 선택합니다.
![createrole](/images/aws/create-workshop-admin-role.png)

## 작업 환경에 IAM 역할 연결
1. [Cloud9 EC2 인스턴스를 찾으려면 이 링크](https://console.aws.amazon.com/ec2/v2/home?#Instances:tag:Name=aws-cloud9-.*workshop.*;sort=desc:launchTime)를 참고하세요.

1. 인스턴스를 선택한 다음 **Actions / Security / Modify IAM role**을 선택합니다.
![c9instancerole](/images/aws/c9-modify-instance-iam-role.png)

1. **IAM Role** 드롭 다운에서 **`DevOpsWorkshop-Admin`**을 선택하고 **Save**을 선택합니다.
![c9attachrole](/images/aws/c9-attach-admin-role.png)

- 작업 환경으로 돌아가서 톱니 바퀴 아이콘(오른쪽 상단 모서리에 있음)을 클릭하거나 클릭하여 새 탭을 열고 "Open Preferences"를 선택합니다.
- **AWS Settings**를 선택합니다.
- **AWS managed temporary credentials** 끕니다.
- 환경 설정 탭 닫습니다.

![c9disableiam](/images/aws/c9-setting-disable-iam-role.png)
