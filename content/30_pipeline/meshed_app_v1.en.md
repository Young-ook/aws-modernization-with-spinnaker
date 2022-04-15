---
title: "Meshed App v1"
chapter: false
weight: 40
---

## Meshed App v1
In this step, we apply the service mesh (AWS App Mesh) to the base application.

### Deploy Pipeline Configuration
Create a new pipeline. There is a Create Pipeline button in the upper right corner of the screen. Enter `meshed-app-v1` as the pipeline name and press OK. Click *Add Stage* to select a step type. This time we are going to deploy, so we choose *Deploy (Manifest)* .

Select the required information. Choose *eks* for Account, *Override Namespace* for Namespace, and select the list that starts with *hello*. (The last 10 characters of the Namespace are anti-duplication serial)

 - **Account:** eks
 - **Namespace:** hello-xxxxx-yyyyy

Go to the S3 screen and specify the application settings file to deploy. Navigate to the *artifact-xxxx-yyyy* bucket and select *2-meshed-app-v1.yaml*. When you get to a screen that displays detailed information about the object, tap the two small overlapping squares in front of the S3 object URI. Confirm the *S3 URI copied* popup and return to the spinnaker pipeline edit page.

![spinnaker-s3-artifact-bucket-copy-uri-meshed-app-v1](/images/spinnaker/s3-artifact-bucket-copy-uri-meshed-app-v1.png)

Continue setting up your deployment environment.

 + Specifies the manifest source as an artifact.
   - **Manifest Source:** Artifact

 + Specify detailed settings for the manifest source. When you click the list next to *Manifest Artifact*, the text *New Artifact Definition* appears. If you press to select, a screen for entering various additional information appears. Here, select *Account* as shown below. Just paste the S3 URI copied earlier into the *Object Path* part.
   - **Account:** platform
   - **Object Path:** s3://artifact-xxxx-yyyy/2-meshed-app-v1.yaml

![spinnaker-pipeline-meshed-app-v1-artifact-object](/images/spinnaker/pipeline-meshed-app-v1-artifact-object.png)

Click *Save Changes* at the bottom of the screen to save. After saving and confirming that the changes are reflected, click the exit-pipeline-arrow to move out of the edit pipeline screen. At the top of the screen, there is a small arrow next to the pipeline name *build*.

### Execute Deploy Pipeline
After setting up your pipeline, click *Start Manual Execution* to run the pipeline.

![spinnaker-pipeline-meshed-app-v1](/images/spinnaker/pipeline-meshed-app-v1.png)

### Side-car Injection
We created a application mesh in App Mesh, but the application is still running as before. So we need to run *Rolling Restart* to force restart the pods. Sidecar proxies are also injected when the pods are restarted. Restart all DB, Redis, AppServer, UI (kubernetes) deployment displayed on the cluster screen. And wait a minute, then the v002 cluster will be created. If all 4 deployments become the v002, the restart is complete.

![spinnaker-deployment-rolling-restart](/images/spinnaker/deployment-rolling-restart.png)

When the application shows as new version (v002), select the pod and press *Console Output* in the details view on the right side of screen. Then you can see the log of the container in the pod as shown below. When ENVOY and XRAY_DAEMON are displayed together, they are properly reflected.

![yelbv2-app-logs](/images/spinnaker/yelbv2-app-logs.png)
