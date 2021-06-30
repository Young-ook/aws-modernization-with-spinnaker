---
title: "Terraform 설치"
chapter: false
weight: 13
---

실습 예제에서는 테라폼([terraform](https://terraform.io)), 쿠버네티스 컨트롤([kubectl](https://kubernetes.io/docs/reference/kubectl/overview/))과 같은 도구를 사용합니다.

테라폼([terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli))은 클라우드 인프라스트럭처를 관리하기 위한 도구 입니다. 코드를 이용해서 인프라스트럭처를 생성하고 변경하고 삭제합니다. 테라폼 코드로 생성한 클라우드 자원은 상태 정보 파일에 기록됩니다. 테라폼은 다음과 같은 장점이 있습니다.

- 인프라스트럭처를 코드로 관리하게 되므로 일관성을 유지할 수 있습니다.
- 인프라스트럭처 코드를 버전 관리할 수 있습니다.
- 인프라스트럭처 변경 사항을 리뷰 할 수 있습니다. 테라폼 코드 리뷰를 통해 변경사항을 미리 살펴 볼 수도 있고, 이력 추적을 통해 변경된 사항을 감사하할 수도 있습니다.
- 테라폼은 플랜 명령을 통해 실제 인프라스트럭처 반영 전 변경사항을 미리 확인해 볼 수 있습니다. 인프라스트럭처 변경은 많은 영향을 끼치므로 최종 반영 전에 변경사항을 파악할 수 있다는 점은 많은 도움이 됩니다.
- 테라폼은 인프라스트럭처 반영내용을 상태 파일로 저장하고 있습니다. 단순히 AWS CLI(명령줄 인터페이스)를 통해 인프라스트럭처를 생성했다면, 현재 생성되어 있는 자원의 정보를 확인하고 변경된 내용만 적용시키기 어려울 것입니다.
- 테라폼은 코드 이므로 재사용이 가능합니다. 코드 자체를 제사용할 수 있으며, 모듈기능을 통해서 추상화된 객체를 조립하는 구조로 재사용할 수도 있습니다.

터미널에서 다음의 명령을 입력하여 테라폼을 설치할 수 있습니다.

```sh
curl --silent --location "https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip" -o /tmp/terraform.zip
```

내려받은 파일을 압축해제 합니다.

```sh
unzip /tmp/terraform.zip -d /tmp
```

모든 사용자가 사용할 수 있도록 다음의 위치로 옮겨서 설치를 마무리 합니다.

```sh
sudo mv -v /tmp/terraform /usr/local/bin/terraform
```

설치 확인을 위해 버전을 출력합니다. 적절한 버전 정보를 확인했다면 제대로 설치한 것입니다.

```sh
terraform version
```