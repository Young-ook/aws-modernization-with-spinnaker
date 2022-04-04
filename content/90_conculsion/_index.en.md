---
title: "Conclusion"
chapter: true
weight: 90
---

# Conclusion
🎉 Congrats! We finished Workshop.

## What have we accomplished
We have:

- Configured continuous delivery pipeline
- Deployed an application consisting of microservices
- Deployed a service mesh
- Deployed metrics dashboard
- Deployed a centralized logging infrastructure
- Deployed a distributed systems tracing infrastructure

## Clean Up
Back to the EC2 workspace. On the screen port-forward logs are shown. Press *ctrl + c* keys to exit port-forward process. Next, prepare infrastructure clean up. Run script:
```sh
cd ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/
./preuninstall.sh
```

It may take servral menuites until delete whole Kubernetes resources including namespace from your cluster.
After script execution is finished, run terraform command to destroy the infrastructure:
```sh
terraform destroy --auto-approve
```

Then, delete terraform (state) backend. Move to the terraform backend configuration directory and run terraform destroy command:
```sh
rm backend.tf
cd ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/backend
terraform destroy --auto-approve
```

Next, Go to the AWS Management Console and get to CloudWatch service page. Select Log groups on the navigation bar on the left of the screen. Enter `hello` for filtering. When log groups start form '/aws/codebuild', '/aws/containerinsights/' appear, choose them and delete like belows.

![delete-log-groups](/images/aws/delete-log-groups.png)

Go to the IAM service page on the AWS Console, select Roles on the navigation bar. Enter `DevOpsWorkshop-Admin` for filtering and delete the IAM role. And Move to the Cloud9 service and delete IDE environment.
