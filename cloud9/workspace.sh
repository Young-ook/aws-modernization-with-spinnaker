#!/bin/bash -ex
# directory for the scripts
mkdir ~/environment/scripts

# tools script
cat > ~/environment/scripts/install-tools <<-"EOF"

#!/bin/bash -ex

kubectl_version=v1.17.11
terraform_version=0.13.5

sudo yum install -y jq gettext bash-completion

sudo curl --silent --location -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${kubectl_version}/bin/linux/amd64/kubectl
sudo chmod +x /usr/local/bin/kubectl
echo 'source <(kubectl completion bash)' >>~/.bashrc
source ~/.bashrc

curl --silent --location "https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip" -o /tmp/terraform.zip
unzip /tmp/terraform.zip -d /tmp 
sudo mv -v /tmp/terraform /usr/local/bin

if ! [ -x "$(command -v jq)" ] || ! [ -x "$(command -v envsubst)" ] || ! [ -x "$(command -v kubectl)" ] || ! [ -x "$(command -v terraform)" ]; then
  echo 'ERROR: tools not installed.' >&2
  exit 1
fi

pip install awscli --upgrade --user

EOF

chmod +x ~/environment/scripts/install-tools
