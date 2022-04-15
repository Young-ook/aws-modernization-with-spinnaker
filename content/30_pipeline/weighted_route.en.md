---
title: "Weighted Routing"
chapter: false
weight: 60
---

## Traffic Management
Now set it to send traffic to the new version of the application server as well. This example sets the traffic to be sent to the old server and the new version server at 50:50.

### Deploy Pipeline Configuration
 Click the *Create Pipeline* button in the upper-right corner of the screen to create a new pipeline. Enter `weighted-route` as the pipeline name and press OK. Click *Add Stage* to select a stage type. This time we are going to deploy, so we choose *Deploy (Manifest)* .

Select the required information. Choose *eks* for Account, *Override Namespace* for Namespace, and select the list that starts with *hello*.

 - **Account:** eks
 - **Namespace:** hello-xxxxx-yyyyy

Go to the S3 screen and specify the application settings file to deploy. Navigate to the *artifact-xxxx-yyyy* bucket and select *4-weighted-route.yaml*. When you get to a screen that displays detailed information about the object, tap the two small overlapping squares in front of the S3 object URI. Confirm the *S3 URI copied* popup and return to the spinnaker pipeline edit page.

![spinnaker-s3-artifact-bucket-copy-uri-weighted-route](/images/spinnaker/s3-artifact-bucket-copy-uri-weighted-route.png)

Continue setting up your deployment environment.

 + Specifies the manifest source as an artifact.
   - **Manifest Source:** Artifact

 + Specify detailed settings for the manifest source. When you click the list next to *Manifest Artifact*, the text *New Artifact Definition* appears. If you press and select, a screen for entering various information appears. Here, select *Account* as shown below. Just paste the S3 URI copied earlier into the *Object Path* part.
   - **Account:** platform
   - **Object Path:** s3://artifact-xxxx-yyyy/4-weighted-route.yaml

![spinnaker-pipeline-weighted-route-artifact-object](/images/spinnaker/pipeline-weighted-route-artifact-object.png)

Click *Save Changes* at the bottom of the screen to save. After saving and verifying that your changes are reflected, click the exit-pipeline-arrow to back to the pipelines screen. At the top of the screen, there is a small arrow next to the pipeline name *build*.

### Execute Deploy Pipeline
After setting up your pipeline, click *Start Manual Execution* to run your pipeline.

![spinnaker-pipeline-weighted-route](/images/spinnaker/pipeline-weighted-route.png)

### Verify Application
Now, if you repeat 'refresh' in your web browser, you can see that the application server version displayed at the bottom of the screen has changed.
