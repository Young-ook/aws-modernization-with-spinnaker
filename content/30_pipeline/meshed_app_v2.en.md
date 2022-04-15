---
title: "Meshed App v2"
chapter: false
weight: 50
---

## Meshed App V2
Now deploy the new version of the application server. Deploy using the new container image created by the AWS CodeBuild pipeline.

### Deploy Pipeline Configuration
First, create a new pipeline. There is a Create Pipeline button in the upper right corner of the screen. Enter `meshed-app-v2` as the pipeline name and press OK. Click *Add Stage* to select a stage type. This time we are going to deploy, so we choose *Deploy (Manifest)* .

Select the required information. Choose *eks* for Account, *Override Namespace* for Namespace, and select the list that starts with *hello*.

 - **Account:** eks
 - **Namespace:** hello-xxxxx-yyyyy

Go to the S3 screen and specify the application settings file to deploy. Navigate to the *artifact-xxxx-yyyy* bucket and select *3-meshed-app-v2.yaml*. When you get to a screen that displays detailed information about the object, tap the two small overlapping squares in front of the S3 object URI. Confirm the *S3 URI copied* popup and return to the spinnaker pipeline edit page.

![spinnaker-s3-artifact-bucket-copy-uri-meshed-app-v2](/images/spinnaker/s3-artifact-bucket-copy-uri-meshed-app-v2.png)

Continue setting up your deployment environment.

 + Specifies the manifest source as an artifact.
   - **Manifest Source:** Artifact

 + Specify detailed settings for the manifest source. When you click the list next to *Manifest Artifact*, the text *New Artifact Definition* appears. If you press and select, a screen for entering various information appears. Here, select *Account* as shown below. Just paste the S3 URI copied earlier into the *Object Path* part.
   - **Account:** platform
   - **Object Path:** s3://artifact-xxxx-yyyy/3-meshed-app-v2.yaml

![spinnaker-pipeline-meshed-app-v2-artifact-object](/images/spinnaker/pipeline-meshed-app-v2-artifact-object.png)

Click *Save Changes* at the bottom of the screen to save. After saving and verifying that your changes are reflected, click the exit-pipeline-arrow to back to the pipelines screen. At the top of the screen, there is a small arrow next to the pipeline name *build*.

### Execute Deploy Pipeline
After setting up your pipeline, click *Start Manual Execution* to run your pipeline.

![spinnaker-pipeline-meshed-app-v2](/images/spinnaker/pipeline-meshed-app-v2.png)

### Verify Application
Even though a new version of the application is deployed, you can't access it even if you repeat 'refresh' on your web browser. This is because you only deploy containers and App Mesh doesn't direct traffic to the new version of the server.
