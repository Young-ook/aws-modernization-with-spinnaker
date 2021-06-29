---
title: "Kubernetes CLI 설치"
chapter: false
weight: 12
---

실습 예제에서는 테라폼([terraform](https://terraform.io)), 쿠버네티스 컨트롤([kubectl](https://kubernetes.io/docs/reference/kubectl/overview/))과 같은 도구를 사용합니다.

쿠버네티스 명령줄 도구인 [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux)은 쿠버네티스 클러스터를 관리하기 위하여 사용합니다. 그리고 이 도구를 이용해서 어플리케이션을 배포하기도하고 클러스터 자원을 관리하기도 합니다. 그리고 로그를 볼 때 사용하기도 합니다.

터미널 환경에서 다음 순서에 따라 설치할 수 있습니다. 아래 명령은 최신 안정화 버전 중 리눅스 환경에서 동작하는 프로그램을 내려받기 합니다.

```sh
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
```

파일을 받았다면, 실행 권한을 추가합니다.

```sh
chmod +x ./kubectl
```

모든 사용자가 사용할 수 있도록 다음의 위치로 옮겨서 설치를 마무리 합니다.

```sh
sudo mv ./kubectl /usr/local/bin/kubectl
```

설치 확인을 위해 버전을 출력합니다. 적절한 버전 정보를 확인했다면 제대로 설치한 것입니다.

```sh
kubectl version --client
```