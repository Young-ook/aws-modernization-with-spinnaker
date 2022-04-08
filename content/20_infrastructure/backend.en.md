---
title: "Terraform Backend"
chapter: false
weight: 10
---

## Terraform Backend
Terraform backend stores and manages the state of resources created using Terraform. By defaut, without additional user configuration, it exists as a file in the local workspace that performs terraform run. This is called a local backend. This local backend is currently inconvenient to manage and share the up-to-date state of resources. So, you can use S3 and DynamoDB to support collaboration, and have a backend that keeps the state of the created resource in a storage with a high level of stability. Safely storing the state of the resources created by Terraform can overcome the problem of concurrency for collaboration and the problem of not knowing what kind of resource is being managed by Terraform due to a sudden accident.

### Preparation
First, prepare Terraform. It will automatically download the required Terraform modules and providers ([providers](https://registry.terraform.io/browse/providers)). A provider is a wrapper around a cloud provider's API.
```sh
cd ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/backend
```
```sh
terraform init
```

### Terraform Apply
Run terraform command to apply terraform configuration to your cloud environment:
```sh
terraform apply
```

Executing the command displays the execution plan for creating AWS resources. You can preview which resources will be created based on your Terraform code and which ones will be deleted. Finally, there is a procedure to confirm whether to be actually **reflected** and if you see a question, enter *yes* to move on to the next step.

### Copy Terraform Backend Configuration
When you finish creating the Terraform backend, it will generate configuration file specifying the Terraform backend in the same directory. When you open the file, the content is similar as below. The name of the S3 bucket to store the Terraform state is automatically populated. The bucket is created with Terraform, and it was designed to prevent duplication by adding random characters to the end of the name. More information is in the [terraform-aws-tfstate-backend](https://github.com/Young-ook/terraform-aws-tfstate-backend) repository.
```sh
terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "hello-tfstate-gyyqc"
    key    = "state"
  }
}
```

Move the generated terraform configuration file to the workspace, actually, the parent directory.
```sh
mv backend.tf ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/
cd ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/
```

Now, you are ready to configure your infrastructure with Terraform backed. Go to the next step and start creating the infrastructure.
