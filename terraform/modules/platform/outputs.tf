module "aws-partitions" {
  source = "Young-ook/spinnaker/aws//modules/aws-partitions"
}

resource "local_file" "halconfig" {
  content = templatefile("${path.module}/templates/halconfig.tpl", {
    aws_account_id              = module.aws-partitions.caller.account_id
    aws_region                  = module.aws-partitions.region.name
    spinnaker_bucket            = module.spinnaker.bucket_name
    spinnaker_managed_aws_role  = module.spinnaker-managed.role_arn
    spinnaker_update_kubeconfig = module.spinnaker.kubeconfig
    eks_update_kubeconfig       = var.eks_kubeconfig["script"]
    eks_kubeconfig_context      = var.eks_kubeconfig["context"]
    halyard_kubectl_exec        = "kubectl -n spinnaker exec -it cd-spinnaker-halyard-0 --"
  })
  filename        = "${path.cwd}/halconfig.sh"
  file_permission = "0700"
}

resource "local_file" "tunnel" {
  content = join("\n", [
    "#!/bin/bash -ex",
    "export KUBECONFIG=spinnaker_kubeconfig",
    "kubectl -n spinnaker port-forward svc/spin-deck 9000:9000",
    ]
  )
  filename        = "${path.cwd}/tunnel.sh"
  file_permission = "0700"
}

resource "local_file" "preuninstall" {
  content = templatefile("${path.module}/templates/preuninstall.tpl", {
    aws_region                  = module.aws-partitions.region.name
    spinnaker_bucket            = module.spinnaker.bucket_name
    spinnaker_artifact_bucket   = module.spinnaker.artifact_repository
    spinnaker_update_kubeconfig = module.spinnaker.kubeconfig
    eks_update_kubeconfig       = var.eks_kubeconfig["script"]
    eks_kubeconfig_context      = var.eks_kubeconfig["context"]
  })
  filename        = "${path.cwd}/preuninstall.sh"
  file_permission = "0700"
}
