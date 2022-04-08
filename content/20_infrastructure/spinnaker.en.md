---
title: "Spinnaker"
chapter: false
weight: 40
---

## Spinnaker
Spinnaker is a multi-cloud, continuous deployment tool. Developed by Netflix and released as an open-source project, this software provides intuitive and systematic support for managing pipelines and server instances for software development lifecycle.

When Terraform apply completes, a **halconfig.sh** script is created in your local workspace. The script creates the EKS cluster's kubeconfig file, and configures AWS CodeBuild projects, an S3 bucket for build artifacts to Spinnaker using Halyard, a command line tool for spinnaker setup.
```sh
./halconfig.sh
```

After the script has finished running, wait a minute and then type the following command: The script redistributes microservices are consist of Spinnaker, so you have to wait a while the new version of Spinnacker is up and running.

When the script finishes running, wait a moment and enter the following command: The script redistributes Spinnaker, which consists of several microservices, so you will have to wait a while for the new version of Spinnaker to run.

To access the spinnaker, run command:
```
./tunnel.sh
```

If you see that the connection success log is displayed as shown below, open `http://localhost:8080` on a web browser. Or if your are running this example in Cloud9, click *Preview* and *Preview of running application* at the top of the Cloud9. This opens up a preview tab and shows the spinnaker application. We recommend Chrome or Firefox as the web browser.
<pre>
Forwarding from 127.0.0.1:8080 -> 9000
Forwarding from [::1]:8080 -> 9000
</pre>
 
![spinnaker-first-look](/images/spinnaker/spinnaker-first-look.png)

🎉 Congrats, you’ve deployed the spinnaker on your kubernetes cluster.
