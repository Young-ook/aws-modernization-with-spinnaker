---
title: "Setup Cloud9 IDE"
chapter: false
weight: 14
---

{{% notice warning %}}
The Cloud9 working environment must be built by an IAM user with administrator privileges, not the root account user. Make sure you are logged in as an IAM user, not a root account user.
{{% /notice %}}

{{% notice info %}}
This workshop is designed to run in the **Seoul (ap-northeast-2)** region. **Do not run in other regions.** Future versions of this workshop will expand regional availability and will remove this message.
{{% /notice %}}

{{% notice tip %}}
You must disable ad blockers, JavaScript disablers, and tracking blockers for your Cloud9 domain. Otherwise, your connection to your work environment may be affected. Cloud9 requires third-party cookies. You can add [specific domains](https://docs.aws.amazon.com/cloud9/latest/user-guide/troubleshooting.html#troubleshooting-env-loading) to whitelist.
{{% /notice %}}

### Launch Cloud9 IDE:
Create a new Cloud9 environment: [Cloud9 Service Console](https://ap-northeast-2.console.aws.amazon.com/cloud9/home?region=ap-northeast-2)

{{% notice warning %}}
Set the Cloud9 environment name to *DevOpsWorkshop*.
{{% /notice %}}

Select **Create environment**. Enter **`DevOpsWorkshop`** to name and accept all other default settings. When Cloud9 starts, close the **welcome tab** and **lower work area** and open a new **terminal** tab in the default work environment to customize the environment.
![c9before](/images/aws/c9-init.png)

Your working environment should now look like this:
![c9after](/images/aws/c9-terminal.png)

If you like this theme, you can choose it yourself by selecting **View / Themes / Solarized / Solarized Dark** from the Cloud9 workspace menu.

## Connect IAM Role
Lokking for your Cloud9 EC2 instance refer to the [EC2 Service Console](https://console.aws.amazon.com/ec2/v2/home?#Instances:tag:Name=aws-cloud9-.*workshop.*;sort=desc:launchTime).

Select the EC2 instance. Then, select the following sequentially: **Actions / Security / Modify IAM role** .
![c9instancerole](/images/aws/c9-modify-instance-iam-role.png)

On the **IAM Role** drop down menu, select **`DevOpsWorkshop-Admin`** and choose **Save**.
![c9attachrole](/images/aws/c9-attach-admin-role.png)

Go back to your work environment and clicking the gear icon (located in the upper right corner). Choose **AWS Settings** and turn off **AWS managed temporary credentials**. Then, close the Preferences tab.
![c9disableiam](/images/aws/c9-setting-disable-iam-role.png)

Go to the Cloud9 service page on AWS console. Run command to install prerequisites.
```sh
sudo yum -y install jq
```

Then, register the current AWS Region and AWS account information in the system environment variables. This step is very important because we need these environment variables for this lab. If you get an error when registering environment variables, do not skip this step.
```sh
rm -vf ${HOME}/.aws/credentials
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || echo AWS_REGION is not set
aws sts get-caller-identity --query Arn | grep DevOpsWorkshop-Admin -q && echo "IAM role valid" || echo "IAM role NOT valid"
```

Check that the output region information is correct and the result of 'IAM role valid' is output.

## Clone the Lab example code repository

Clone the example source code from the repository.
```sh
git clone https://github.com/Young-ook/terraform-aws-spinnaker.git
```

When ready, proceed to the next step.

## Prerequisites
In this lab, we use [Terraform](https://terraform.io), and [Kubernetes-cli](https://kubernetes.io/docs/reference/kubectl/overview/). Follow the instructions in the next step to install the prerequisites.
