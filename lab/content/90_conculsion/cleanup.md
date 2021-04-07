---
title: "Cleanup"
chapter: false
weight: 10
---

## 실습 환경 정리

EC2 실습 환경으로 돌아옵니다. 여전히 Port Forward 로그가 찍히고 있을 것입니다. *ctrl + c* 를 눌러서 Port Forward 프로세스를 종료합니다. 다음, 인프라스트럭처 삭제 사전 작업으로 어플리케이션에서 생성한 자원을 삭제합니다. 다음과 같이 스크립트를 수행합니다. 쿠버네티스 네임스페이스를 삭제하는 시간이 오래 걸리니 스크립트가 종료될 때까지 중단하지 않도록 합니다.

```sh
./preuninstall.sh
```

스크립트 수행이 완료되면, 테라폼 명령으로 인프라스트럭처를 제거합니다.

```sh
terraform destroy -var-file default.tfvars --auto-approve
```

삭제가 완료되면 EC2 인스턴스를 빠져 나옵니다. AWS 콘솔로 들어가서 CloudFormation 서비스로 이동합니다.
**스택 이름**이 *DevOpsWorkshopWorkspace* 인 것을 선택하고 삭제합니다.