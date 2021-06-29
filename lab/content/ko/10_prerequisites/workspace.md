---
title: "작업 환경 만들기"
chapter: false
weight: 14
---

{{% notice warning %}}
Cloud9 작업 환경은 루트 계정 사용자가 아닌 관리자 권한이 있는 IAM 사용자가 구축해야 합니다. 루트 계정 사용자가 아닌 IAM 사용자로 로그인했는지 확인하십시오.
{{% /notice %}}

{{% notice info %}}
이 워크샵은 **Seoul (ap-northeast-2)** 지역에서 실행되도록 설계되었습니다. **다른 지역에서는 실행하지 마십시오.**이 워크숍의 향후 버전에서는 지역 가용성이 확대되며 이 메시지는 제거됩니다.
{{% /notice %}}

{{% notice tip %}}
Cloud9 도메인에 대해 광고 차단기, 자바 스크립트 비활성화기 및 추적 차단기를 비활성화 해야합니다. 그렇지 않으면 작업 환경에 대한 연결이 영향을 받을 수 있습니다.
Cloud9에는 타사 쿠키가 필요합니다. [특정 도메인](https://docs.aws.amazon.com/cloud9/latest/user-guide/troubleshooting.html#troubleshooting-env-loading)을 화이트리스트에 추가 할 수 있습니다.
{{% /notice %}}

### Cloud9 시작:
Cloud9 환경을 만듭니다. [https://ap-northeast-2.console.aws.amazon.com/cloud9/home?region=ap-northeast-2](https://ap-northeast-2.console.aws.amazon.com/cloud9/home?region=ap-northeast-2)

{{% notice warning %}}
Cloud9 환경의 이름을 'DevOpsWorkshop'으로 지정합니다.
{{% /notice %}}

- **Create environment**를 선택합니다.
- 이름을 **DevOpsWorkshop**으로 지정하고 다른 모든 기본값을 사용합니다.
- Cloud9이 시작되면 **welcome tab** 및 **lower work area** 을 닫고 기본 작업 환경에서 새 **terminal** 탭을 열어 환경을 사용자 지정합니다.
![c9before](/images/aws/c9before.png)

- 이제 작업 환경이 다음과 같아야합니다.
![c9after](/images/aws/c9after.png)

- 이 테마가 마음에 들면, Cloud9 작업 환경 메뉴에서 **View / Themes / Solarized / Solarized Dark**를 선택하여 직접 선택할 수 있습니다.
