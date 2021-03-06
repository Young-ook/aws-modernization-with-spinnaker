---
title: "실습 종료"
chapter: true
weight: 90
---

# 마무리
🎉 축하합니다! 실습을 완료하였습니다.

## 실습을 통해 얻은 것
- 지속적 배포 파이프라인 구축
- 마이크로스비스로 구성된 애플리케이션 배포
- 서비스 메시 적용
- 모니터링 대시보드 구성
- 중앙 집중식 로그 수집 인프라스트럭처
- 분산 시스템 추적 시스템 인프라스트럭처

## 실습 환경 정리
EC2 실습 환경으로 돌아옵니다. 여전히 Port Forward 로그가 찍히고 있을 것입니다. *ctrl + c* 를 눌러서 Port Forward 프로세스를 종료합니다. 다음, 인프라스트럭처 삭제 사전 작업으로 어플리케이션에서 생성한 자원을 삭제합니다. 다음과 같이 스크립트를 수행합니다. 쿠버네티스 네임스페이스를 삭제하는 시간이 오래 걸리니 스크립트가 종료될 때까지 중단하지 않도록 합니다.

```sh
cd ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/
./preuninstall.sh
```

스크립트 수행이 완료되면, 테라폼 명령으로 인프라스트럭처를 제거합니다.

```sh
terraform destroy --auto-approve
```

인프라스트럭처 삭제가 완료되면, 테라폼 백엔드를 정리합니다.

```sh
rm backend.tf
cd ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/backend
terraform destroy --auto-approve
```

삭제가 완료되면, AWS 콘솔로 가서 CloudWatch 서비스로 이동합니다. 로그 그룹(Log groups)를 선택하고 검색 창에서 `hello` 를 입력합니다. 그림과 같이 '/aws/codebuild', '/aws/containerinsights/'로 시작하는 로그 그룹을 선택한 다음 삭제 합니다.

![delete-log-groups](/images/aws/delete-log-groups.png)

삭제가 완료되면 AWS 콘솔로 들어가서 IAM 서비스로 이동합니다. 역할(Roles)을 선택하고 `DevOpsWorkshop-Admin` 을 검색합니다. 해당 역할을 선택 후 삭제 합니다. 다음, Cloud9 서비스로 이동합니다. 작업을 위해 생성한 환경을 삭제합니다.
