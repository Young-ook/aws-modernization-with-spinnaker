# workspace setup tool for macOS
# Prerequisites: git
#!/bin/bash -x

brew install awscli jq kubernetes-cli tfenv

tfenv install 0.13.5
tfenv use 0.13.5
