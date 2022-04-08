---
title: "Install Terraform CLI"
chapter: false
weight: 12
---

## Terraform
Terraform is an open-source infrastructure as code software tool created by HashiCorp. Users define and provide both cloud and on-premises infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL), or optionally JSON. Users can version, reuse, and share these terraform configuration files and also, use a consistent workflow to provision and manage all of their infrastructure throughout its lifecycle.

![terraform-iac-concept](/images/terraform/iac-concept.png)

Terraform supports a number of cloud infrastructure providers such as Amazon Web Services (AWS), Microsoft Azure, IBM Cloud, Serverspace, Google Cloud Platform(GCP), DigitalOcean, Oracle Cloud Infrastructure, VMware vSphere, and OpenStack. For more details about 'What is Terraform', please visit the HashiCorp [website](https://www.terraform.io/intro#what-is-terraform).

## Terraform Module
Terraform module is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

In addition to modules from the local filesystem, Terraform can load modules from a public or private registry. HashiCorp launched the Terraform Module Registry in 2017, this makes it possible to publish modules for others to use, and to use modules that others have published. Initially, it only supported saving and sharing terraform modules. It has now become a general-purpose repository that supports both Providers and Modules. And the name has been changed from Terraform Module Registry to Terraform Registry. The Terraform Registry hosts a broad collection of publicly available Terraform modules for configuring many kinds of common infrastructure. These modules are free to use, and Terraform can download them automatically if you specify the appropriate source and version in a module call block.

Terraform modules can be very powerful building blocks for quickly building a solid infrastructure. Users can build their own infrastructure using Terraform modules in many cloud environments. Below is a conceptual diagram of Terraform-based infrastructure building blocks.

![terraform-infra-building-blocks](/images/terraform/infra-building-blocks.png)

## Terraform CLI
Terraform CLI([terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)) is an open-source infrastructure as code software tool. Terraform uses code to create, modify, and delete infrastructure and cloud resources created by Terraform configuration are recorded in a state information file. Terraform has the following advantages:

- Because you manage your infrastructure as code, you can maintain consistency.
- Control the version of infrastructure code.
- Review infrastructure changes. You can preview changes through Terraform code review or audit changes through historical tracking.
- Terraform can check the changes before the actual infrastructure is reflected through the plan command. Infrastructure changes have a lot of impact, so being able to catch changes before final reflection is very useful.
- Terraform stores infrastructure reflections as state files.
- Terraform code is reusable. The code itself can be reused, and objects abstracted through module functions can be reused as a combined structure.

Run command to download terraform release.
```sh
export TF_VER=1.0.3
curl --silent --location "https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip" -o /tmp/terraform.zip
```

Unzip the downloaded file.
```sh
unzip /tmp/terraform.zip -d /tmp
```

Move the unzipped binary file to a shared directory. Now, any user on the system can run the terraform command.
```sh
sudo mv -v /tmp/terraform /usr/local/bin/terraform
```

Print the Terraform version to verify the installation. If the version information is displayed, the installation is complete.
```sh
terraform version
```
