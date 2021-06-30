---
title: "작업 환경에 대한 IAM 역할 생성"
chapter: false
weight: 13
---

{{% notice info %}}
여기부터 아래와 같이 입력할 명령어가 보이면 Cloud9 IDE에 입력합니다. **Copy to clipboard** 기능 (오른쪽 상단 모서리)을 사용하여 Cloud9에 간단히 복사하여 붙여 넣을 수 있습니다. 붙여 넣으려면 Windows의 경우 Ctrl + V를, Mac의 경우 Command + V를 사용할 수 있습니다.
{{% /notice %}}

1. [관리자 액세스 권한이 있는 IAM 역할을 생성하려면 이 링크](https://console.aws.amazon.com/iam/home#/roles$new?step=review&commonUseCase=EC2%2BEC2&selectedUseCase=EC2&policies=arn:aws:iam::aws:policy%2FAdministratorAccess)를 따르십시오.
1. **AWS service** 및 **EC2**가 선택되었는지 확인한 후 **Next**를 클릭하여 권한을 확인합니다.
1. **AdministratorAccess**가 선택되었는지 확인하고 **Next**를 클릭하여 검토합니다.
1. 이름으로 **DevOpsWorkshop-Admin**을 입력하고 **Create Role**를 선택합니다.
![createrole](/images/aws/createrole.png)
