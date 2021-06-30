---
title: "2.5 메시드 앱 v2"
chapter: false
weight: 50
---

## 메시드 앱(Meshed App) V2

새 버전의 어플리케이션 서버를 배포합니다. AWS CodeBuild 파이프라인에서 생성한 새로운 컨테이너 이미지를 이용하여 배포할 것 입니다.

### 배포 파이프라인 설정

새 파이프라인을 생성합니다. 화면 오른 쪽 윗 부분에 파이프라인 생성 단추가 있습니다. 파이프라인 이름으로 `meshed-app-v2` 입력하고 확인을 누릅니다. *Add stage* 를 눌러서 스테이지의 종류를 선택합니다. 이 번에는 배포를 할 것이므로 **Deploy (Manifest)**를 선택합니다.

필요한 정보를 선택합니다. Account는 *eks* 를 선택하고 Namespace는 *Override Namespace* 를 눌러서 나오는 목록 중 *hello* 로 시작하는 것을 선택합니다. (네임스페이스 이름의 뒷 10자리는 테라폼을 수행할 때 자동으로 지정되는 pet name 이므로 상황에 따라 달라질 수 있습니다)

 - **Account:** eks
 - **Namespace:** hello-xxxxx-yyyyy

배포할 어플리케이션 설정 파일을 지정하기 위해서 S3 화면으로 이동합니다. *spinnaker-xxxxx-artifact* 버켓으로 이동해서 *3-meshed-app-v2.yaml* 을 선택합니다. 객체에 대한 자세한 정보를 표시하는 화면으로 이동했다면, S3 객체 URI 앞에 있는 작은 사각형이 두 개 겹쳐있는 모양을 누릅니다. *S3 URI 복사됨* 팝업을 확인했으면, 다시 스핀에커 파이프라인 편집 화면으로 돌아갑니다.

![spinnaker-s3-artifact-bucket-copy-uri](/images/spinnaker/s3-artifact-bucket-copy-uri.png)

배포환경 설정을 이어서 진행합니다.

 + 매니페스트 소스를 아티팩트로 지정합니다.
   - **Manifest Source:** Artifact

 + 매니페스트 소스의 세부 설정을 지정합니다. *Manifest Artifact* 옆의 목록을 누르면 *Define a new artifact* 문구가 나타납니다. 눌러서 선택하면 여러 정보들을 입력하는 화면이 나타납니다. 여기서 *Account* 를 아래와 같이 선택합니다. Object Path 부분에는 앞에서 복사한 S3 URI를 붙여넣으면 됩니다. Object Path 부분에는 앞에서 복사한 S3 URI를 붙여넣으면 됩니다.
   - **Account:** platform
   - **Object Path:** s3://spinnaker-xxxxx-artifact/3-meshed-app-v2.yaml

![spinnaker-pipeline-base-app-v1-artifact-object](/images/spinnaker/pipeline-base-app-v1-artifact-object.png)

화면 맨 아래 **Save Changes**를 눌러서 저장합니다.
저장 후 변경사항이 반영 된 것을 확인했으면, 파이프라인 빠져 나오기 화살표를 눌러서 파이프라인 편집 화면 밖으로 이동합니다. 화면 위 쪽, **build**라고 되어 있는 파이프라인 이름 옆에 작은 화살표가 있습니다.

### 배포 파이프라인 실행

파이프라인 설정이 되었으면, *Start Manual Execution* 을 눌러서 파이프라인을 실행합니다.

![spinnaker-pipeline-meshed-app-v2](/images/spinnaker/pipeline-meshed-app-v2.png)

### 어플리케이션 확인

새로운 버전의 어플리케이션이 배포가 되었지만, ALB를 통해서 접속한 서비스는 '새로고침'을 반복해도 변화가 없습니다. 컨테이너만 배포를 했을 뿐, App Mesh에서 트래픽을 새 버전의 서버로 보내지 않고 있기 때문입니다.