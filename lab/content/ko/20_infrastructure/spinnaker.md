---
title: "1.4 스핀에커"
chapter: false
weight: 40
---

## 스핀에커

스핀에커(Spinnaker)는 멀티 클라우드를 지원하는 지속적 전달(Continuous Delivery)도구 입니다. 넷플릭스에서 개발하여 오픈소스로 공개하였으며, 소프트웨어 배포를 위한 파이프라인과 서버 인스턴스를 관리를 직관적이고 체계적으로 지원합니다.

테라폼 수행이 끝나면, 작업환경에 **halconfig.sh** 스크립트가 생성될 것입니다. 해당 스크립트는 어플리케이션 배포를 위한 EKS 클러스터의 kubeconfig 파일, AWS CodeBuild 프로젝트 이름, 빌드 결과물(Artifact)을 보관할 S3 버켓 정보를 스핀에커에 등록하는 작업을 수행합니다.

```sh
./halconfig.sh
```

스크립트 실행이 끝나면 다음 명령을 입력합니다.

```
kubectl -n spinnaker port-forward svc/spin-deck 8080:9000
```

아래와 같이 연결 성공 로그가 찍히는 것을 확인했다면, 화면 상단의 *Preview* 와 *Preview Running Application* 을 눌러서 접속합니다. 웹 브라우저는 Chrome 또는 Firefox를 권장합니다.

<pre>
Forwarding from 127.0.0.1:8080 -> 9000
Forwarding from [::1]:8080 -> 9000
</pre>
 
![spinnaker-first-look](/images/spinnaker/spinnaker-first-look.png)

🎉 축하합니다. 위와 같은 화면이 보인다면 성공적으로 접속한 것입니다.