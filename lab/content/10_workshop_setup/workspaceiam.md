---
title: "작업 환경에 IAM 역할 연결"
chapter: false
weight: 15
---

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
