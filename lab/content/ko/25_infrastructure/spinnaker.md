---
title: "1.4 Spinnaker"
chapter: false
weight: 40
---

## Spinnaker Setup

테라폼 수행이 끝나면, 작업환경에 **halconfig.sh** 스크립트가 생성될 것입니다. 해당 스크립트는 어플리케이션 배포를 위한 EKS 클러스터의 kubeconfig 파일, AWS CodeBuild 프로젝트 이름, 빌드 결과물(Artifact)을 보관할 S3 버켓 정보를 스핀에커에 등록하는 작업을 수행합니다.

```sh
./halconfig.sh
```

스크립트 실행이 끝나면 *exit* 명령을 입력하거나 *ctrl + d* 를 눌러서 EC2 리눅스 작업 환경을 빠져나옵니다.
스핀에커 접속을 위하여 다음과 같이 SSH Port Forward 설정을 추가하여 다시 EC2 인스턴스에 연결합니다. 여기서 {EC2 IP}는 방금 빠져나온 EC2 인스턴스의 IP 주소입니다.

```sh
ssh -i devops-workshop-keypair.pem -L 9000:localhost:9000 ec2-user@{EC2 IP}
```

재접속에 성공했다면, **terraform** 디렉토리로 이동합니다.
```sh
cd aws-modernization-with-spinnaker/terraform
```

이번에는 EC2 리눅스 환경에서 스핀에커로 Port Forward를 설정합니다.

```sh
./tunnel.sh
```

다음과 같이 연결 로그가 찍히는 것을 확인했다면, 웹 브라우저로 가서  *localhost:9000* 으로 접속합니다. 웹 브라우저는 Chrome 또는 Firefox를 권장합니다.

<pre>
kubectl -n spinnaker port-forward svc/spin-deck 9000:9000
Forwarding from 127.0.0.1:9000 -> 9000
Forwarding from [::1]:9000 -> 9000
</pre>

![spinnaker-first-look](/images/spinnaker/spinnaker-first-look.png)

🎉 축하합니다. 위와 같은 화면이 보인다면 성공적으로 접속한 것입니다.