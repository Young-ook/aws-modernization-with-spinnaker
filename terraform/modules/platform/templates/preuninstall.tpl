#!/bin/bash -ex

export KUBECONFIG=kubeconfig

${eks_update_kubeconfig}
kubectl delete ns ${eks_kubeconfig_context}
kubectl delete mesh yelb-mesh

${spinnaker_update_kubeconfig}
kubectl delete ns spinnaker

rm kubeconfig spinnaker_kubeconfig

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

volumes=$(aws ec2 describe-volumes \
  --filters Name=tag:kubernetes.io/created-for/pvc/namespace,Values=spinnaker \
  --query "Volumes[*].{ID:VolumeId}" \
  --region ${aws_region} \
  --output text)

for volume in volumes
do
  aws ec2 delete-volume --volume-id $volume --region ${aws_region}
done

unset KUBECONFIG
