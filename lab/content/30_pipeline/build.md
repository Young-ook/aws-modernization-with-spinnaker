---
title: "2.2 빌드"
chapter: false
weight: 20
---

## 빌드

AWS CodeBuild를 이용하여 컨테이너 이미지를 빌드 합니다. 빌드에 성공하면 컨테이너 이미지는 ECR에 저장되며, 쿠버네티스(Kubernetes) 매니페스트 파일들은 S3 버켓에 저장됩니다. S3 버켓 이름은 테라폼에서 생성할 때 임의의 이름이 추가됩니다. S3 서비스에서 배켓을 조회하면 *spinnaker-xxxxx-artifact* 와 같은 형식의 이름을 가진 버켓을 볼 수 있습니다.

### 빌드 파이프라인 설정

**yelb** 어플리케이션을 생성했다면, 이제 그 안에서 파이프라인을 만들어야 합니다. 화면에 나타난 *Create new pipeline* 을 눌러서 파이프라인 이름을 입력합니다. `build` 를 입력하고 확인을 누르면 파이프라인을 편집할 수 있는 화면이 나옵니다.

![spinnaker-pipeline-create](/images/spinnaker/pipeline-create.png)

다음, *Add stage* 를 누르면 파이프라인에 추가할 작업을 선택할 수 있습니다. 여기서 **AWS CodeBuild**를 선택합니다. 그러면 아래에 빌드 작업에 필요한 정보를 입력하는 공간이 나타납니다.

![spinnaker-pipeline-codebuild-stage](/images/spinnaker/pipeline-codebuild-stage.png)

필요한 정보를 입력합니다. (프로젝트 이름의 뒷 10자리는 테라폼을 수행할 때 자동으로 지정되는 pet name 이므로 상황에 따라 달라질 수 있습니다)

 - **Account:** platform
 - **Project Name:** yelb-hello-xxxxx-yyyyy

![spinnaker-pipeline-build-project-name](/images/spinnaker/pipeline-build-project-name.png)

화면 맨 아래 **Save Changes**를 눌러서 저장합니다.
저장 후 변경사항이 반영 된 것을 확인했으면, 파이프라인 빠져 나오기 화살표를 눌러서 파이프라인 편집 화면 밖으로 이동합니다. 화면 위 쪽, **build**라고 되어 있는 파이프라인 이름 옆에 작은 화살표가 있습니다.

### 빌드 파이프라인 실행

파이프라인 설정이 되었으면, *Start Manual Execution* 을 눌러서 파이프라인을 실행합니다. CodeBuild 프로젝트가 빌드를 시작하며 약 2분 정도 소요됩니다.

### 빌드 결과물 확인

빌드가 성공했으면, AWS 콘솔로 들어가서 ECR 서비스 화면으로 이동합니다. 새로 생성한 컨테이터 이미지가 나타날 것입니다. 그리고 S3 서비스 화면으로 이동합니다. 버켓 목록 중 *spinnaker-xxxxx-artifact* 와 같은 형식의 이름을 가진 버켓이 있을 것입니다. 해당 버켓을 눌러서 안으로 들어갑니다.

![s3-artifact-bucket](/images/spinnaker/s3-artifact-bucket.png)