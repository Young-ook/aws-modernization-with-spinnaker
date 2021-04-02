#!/bin/bash -ex

export KUBECONFIG=spinnaker_kubeconfig

kubectl delete ns spinnaker

aws s3api delete-objects \
  --region ${aws_region} \
  --bucket ${spinnaker_bucket} \
  --delete "$(aws s3api list-object-versions \
      --bucket ${spinnaker_bucket} \
      --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}' \
      --region ${aws_region} \
      --output json)"

aws s3api delete-objects \
  --region ${aws_region} \
  --bucket ${spinnaker_artifact_bucket} \
  --delete "$(aws s3api list-object-versions \
      --bucket ${spinnaker_artifact_bucket} \
      --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}' \
      --region ${aws_region} \
      --output json)"

unset KUBECONFIG
