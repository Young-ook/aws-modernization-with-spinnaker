---
title: "Platform"
chapter: false
weight: 30
---

## Platform
The platform module builds a DevOps environment to manage the lifecycle of an application. Build an environment that builds your application as a container image and stores it in a repository. With AWS CodeBuild, a managed build tool, you can easily build software and container without having to maintain/manage the build tools yourself. You just writing a build manifest and run AWS CodeBuild job. Elastic Container Registry (ECR) is a managed container image repository. By default, ECR is private repository which means that the container images are only accessible within your AWS account. Therefore, not only can it be safely managed, but it is a managed service, so you can use it easily and comfortably without the burden of maintenance. The platform module configures Spinnaker([spinnaker](https://spinnaker.io)). Spinnacker is a multi-cloud continuous deployment tool. You can create pipelines to automate software build, validation, and distribution, and extend functions by interworking with external systems. And by visually displaying instances or containers, you can intuitively understand the status of your current service. It can also be controlled quickly and easily through the cluster management UI.

{{% notice info %}}
Details of the code used to create the Spinnaker in this example are in the [terraform-aws-spinnaker](https://github.com/Young-ook/terraform-aws-spinnaker) repository.
{{% /notice %}}

### Preparation
First, prepare Terraform. It will automatically download the required Terraform modules and providers ([providers](https://registry.terraform.io/browse/providers)). A provider is a wrapper around a cloud provider's API. If you completed it in the previous step, 'Foundation', you can skip it.
```sh
cd ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/
```
```sh
terraform init
```

### Terraform Apply
Run terraform command to apply terraform configuration to your cloud environment:
```sh
terraform apply -target module.platform
```

When you run the command, you get an execution plan for creating AWS resources, and asks if you want to **reflect** it. Enter *yes* to proceed to the next step.

The time being reflected is displayed on the screen. Spinnaker also uses a separate EKS cluster. So, just like the previous step, it will take about 15-20 minutes to bring up platform infrastructure with terraform .