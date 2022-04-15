---
title: "Build"
chapter: false
weight: 20
---

## Build
Build the container image using AWS CodeBuild. If the build is successful, the container image is saved to ECR and the Kubernetes manifest file is saved to the S3 bucket. The S3 bucket name is randomly added when Terraform creates it. If you look up the bucket in the S3 service, you will see a bucket with a name of the form *artifact-xxxx-yyyy*.

### Build Pipeline Configuration
Now that we have created the **yelb** application, we need to create a pipeline within it. Enter a pipeline name by clicking *Create New Pipeline* that appears on the screen. Enter `build` and press *Create* to bring up a screen where you can edit your pipeline.

![spinnaker-pipeline-create](/images/spinnaker/pipeline-create.png)

Next, you can click *Add Stage* to add to your pipeline. Choose *AWS CodeBuild* here. A space will then appear below where you can enter the necessary information for the build task.

![spinnaker-pipeline-codebuild-stage](/images/spinnaker/pipeline-codebuild-stage.png)

Please enter the required information (The last 10 characters of the project name are anti-duplication serial automatically assigned by Terraform, and may vary depending on the situation).

 - **Account:** platform
 - **Project Name:** yelb-hello-xxxxx-yyyyy

![spinnaker-pipeline-build-project-name](/images/spinnaker/pipeline-build-project-name.png)

Click *Save Changes* at the bottom of the screen to save.
After saving and verifying that your changes are reflected, click the End Pipeline arrow to navigate to the Edit Pipeline screen. At the top of the screen, there is a small arrow next to the pipeline name *build*.

### Execute Build Pipeline
After setting up your pipeline, click *Start Manual Execution* to run your pipeline. The CodeBuild project will start building, which will take about 2 minutes.

### Verify Artifact
If the build is successful, enter the AWS console and go to the ECR service screen. The newly created container image appears. And go to the S3 service screen. The bucket list contains buckets with names of the form *artifact-xxxx-yyyy*. Press the appropriate bucket to get inside.

![s3-artifact-bucket](/images/spinnaker/s3-artifact-bucket.png)
