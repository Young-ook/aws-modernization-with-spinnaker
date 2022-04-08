---
title: "Foundation"
chapter: false
weight: 20
---

## Foundation
The foundation module creates a Virtual Private Cloud (VPC) and Elastic Kubernetes Service (EKS) cluster, the environment in which the application will run. A VPC consists of public subnets connected to the Internet and private subnets isolated from the Internet. An EC2 instance in a private subnet can communicate with the Internet through NAT (Network Address Translation). The private subnets are associated with the VPC endpoint and Instances located in private subnets can call AWS services without external communication through VPC endpoints.

It also installs useful additional features that can be used with EKS. In this lab, we will use Terraform's Helm provider to install App Mesh Controller, Amazon CloudWatch ContainerInsights Agents, and AWS Load Balancer Controller.

{{% notice info %}}
For details of the code used to create the VPC in this example, see [terraform-aws-spinnaker/modules/spinnaker-aware-aws-vpc](https://github.com/Young-ook/terraform-aws-spinnaker/tree/main/modules/spinnaker-aware-aws-vpc) repository.
{{% /notice %}}

{{% notice info %}}
For details of the code used to create EKS in this example, see [terraform-aws-spinnaker/modules/spinnaker-managed-eks](https://github.com/Young-ook/terraform-aws-spinnaker/tree/main/modules/spinnaker-managed-eks) and you can find the original terraform module used by 'spinnaker-managed-eks' module is here: [terraform-aws-eks](https://github.com/Young-ook/terraform-aws-eks).
{{% /notice %}}

### Preparation
First, prepare Terraform. It will automatically download the required Terraform modules and providers ([providers](https://registry.terraform.io/browse/providers)). A provider is a wrapper around a cloud provider's API.
```sh
cd ~/environment/terraform-aws-spinnaker/examples/aws-modernization-with-spinnaker/
```
```sh
terraform init
```

### Terraform Apply
Run terraform command to apply terraform configuration to your cloud environment:
```sh
terraform apply -target module.foundation
```

Executing the command displays the execution plan for creating AWS resources. You can preview which resources will be created based on your Terraform code and which ones will be deleted. Finally, there is a procedure to confirm whether you actually want to **reflect** or not. If you see a question, type *yes* to move on to the next step. The time being reflected is displayed on the screen. For your information, creating an EKS cluster usually takes about 15 minutes.
<pre>
 # module.foundation.module.eks.module.frigga.random_string.suffix will be created
  + resource "random_string" "suffix" {
      + id          = (known after apply)
      + length      = 5
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = false
      + result      = (known after apply)
      + special     = false
      + upper       = false
    }

  # module.foundation.module.vpc.module.frigga.random_string.suffix will be created
  + resource "random_string" "suffix" {
      + id          = (known after apply)
      + length      = 5
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = false
      + result      = (known after apply)
      + special     = false
      + upper       = false
    }

Plan: 41 to add, 0 to change, 0 to destroy.


Warning: Resource targeting is in effect

You are creating a plan with the -target option, which means that the result
of this plan may not represent all of the changes requested by the current
configuration.

The -target option is not for routine use, and is provided only for
exceptional situations such as recovering from errors or mistakes, or when
Terraform specifically suggests to use it as part of an error message.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
</pre>

{{% notice tip %}}
If you want to skip the step of checking the execution plan, you can add the `--auto-approve` option. However, please be aware that it is very dangerous to reflect immediately without going through the screening process.
{{% /notice %}}

You can see the execution status as follows:
<pre>
module.application.module.eks.module.eks.random_string.eks-suffix: Creating...
module.frigga.random_string.suffix: Creating...
module.application.module.eks.module.frigga.random_string.suffix: Creating...
module.foundation.module.vpc.module.frigga.random_string.suffix: Creating...
module.application.module.eks.module.eks.random_string.eks-suffix: Creation complete after 0s [id=brainidgllor]
module.application.module.eks.module.frigga.random_string.suffix: Creation complete after 0s [id=ruqym]
module.frigga.random_string.suffix: Creation complete after 0s [id=xrymv]
module.foundation.module.vpc.module.frigga.random_string.suffix: Creation complete after 0s [id=sorpe]
module.foundation.module.vpc.aws_eip.ngw["ap-northeast-2a"]: Creating...
module.foundation.module.vpc.aws_vpc.vpc: Creating...
module.foundation.module.vpc.aws_eip.ngw["ap-northeast-2a"]: Creation complete after 0s [id=eipalloc-06ec7daac6ed04a59]
module.foundation.module.vpc.aws_vpc.vpc: Still creating... [10s elapsed]
module.foundation.module.vpc.aws_vpc.vpc: Creation complete after 11s [id=vpc-00dd9e53cfe115b5a]
module.foundation.module.vpc.aws_security_group.vpce: Creating...
module.foundation.module.vpc.aws_internet_gateway.igw: Creating...
module.foundation.module.vpc.aws_route_table.public: Creating...
module.foundation.module.vpc.aws_route_table.private["ap-northeast-2a"]: Creating...
module.foundation.module.vpc.aws_subnet.public["ap-northeast-2c"]: Creating...
module.foundation.module.vpc.aws_subnet.public["ap-northeast-2b"]: Creating...
module.foundation.module.vpc.aws_subnet.private["ap-northeast-2a"]: Creating...
module.foundation.module.vpc.aws_subnet.private["ap-northeast-2c"]: Creating...
module.foundation.module.vpc.aws_subnet.private["ap-northeast-2b"]: Creating...
module.foundation.module.vpc.aws_subnet.public["ap-northeast-2a"]: Creating...
module.foundation.module.vpc.aws_route_table.private["ap-northeast-2a"]: Creation complete after 0s
</pre>
