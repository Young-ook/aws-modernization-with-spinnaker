---
title: "Cloud9 IDE Setup"
chapter: false
weight: 13
---

## Setup Cloud9 Workspace

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

## Clone the Lab example codes

Clone the example source code from the repository.
```sh
git clone https://github.com/Young-ook/terraform-aws-spinnaker.git
```

When ready, proceed to the next step.
