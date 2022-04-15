---
title: "Base App v1"
chapter: false
weight: 30
---

## Base App
In this step, we deploy baseline application with databases, cache server, application servers, and UI servers.

### Deploy Pipeline Configuration
Deploy the container application with default settings. Deploy the database, cache, application server, and UI server. First, create a new pipeline. There is a Create Pipeline button in the upper right part of the screen. Enter `base-app-v1` as the pipeline name and apply. Click *Add Stage* to select the type of stage. This time we are going to deploy, so we choose *Deploy (Manifest)* .

![spinnaker-pipeline-base-app-v1-deploy-stage](/images/spinnaker/pipeline-base-app-v1-deploy-stage.png)

Select the required information. Select *eks* for Account and *Override Namespace* for Namespace and choose the list that starts with *hello*.

 - **Account:** eks
 - **Namespace:** hello-xxxxx-yyyyy

![spinnaker-pipeline-base-app-v1-namespace](/images/spinnaker/pipeline-base-app-v1-namespace.png)

Go to the S3 screen and pick the application settings file up you want to deploy. Navigate to the *artifact-xxxx-yyyy* bucket and select *1-base-app-v1.yaml* . When you get to a screen that displays detailed information about the object, tap the two small overlapping squares in front of the S3 object URI. Confirm the *S3 URI copied* popup and return to the spinnaker pipeline edit page.

![spinnaker-s3-artifact-bucket-copy-uri-base-app-v1](/images/spinnaker/s3-artifact-bucket-copy-uri-base-app-v1.png)

Continue setting up your deployment environment.

 + Specifies the manifest source as an artifact.
   - **Manifest Source:** Artifact

 + Specify detailed settings for the manifest source. When you click the list next to *Manifest Artifact*, the text *Define a new Artifact* appears. If you press to select, a screen for entering various additional information appears. Here, select *Account* as shown below. Just paste the S3 URI copied earlier into the *Object Path* part.
   - **Account:** platform
   - **Object Path:** s3://artifact-xxxx-yyyy/1-base-app-v1.yaml

![spinnaker-pipeline-base-app-v1-artifact-object](/images/spinnaker/pipeline-base-app-v1-artifact-object.png)

Click *Save Changes* at the bottom of the screen to save.
After saving and confirming that the changes are reflected, click the exit pipeline arrow to move out of the pipeline editing screen. At the top of the screen, there is a small arrow next to the pipeline name that says *build*.

### Execute Deploy Pipeline
After setting up the pipeline, click *Start Manual Execution* to run the pipeline.

![spinnaker-pipeline-base-app-v1](/images/spinnaker/pipeline-base-app-v1.png)

### Verify Deployment Results
If the deployment is successful, click Clusters in the menu on the left side of the Spinnaker screen. Container information appears. Then, click Load Balancers in the navigation bar to display Kubernetes ingress and services. If you select Ingress, detailed information is displayed on the right side of the screen, and the access domain is displayed.

![ingress-dns](/images/spinnaker/ingress-dns.png)
