resource "null_resource" "download_istio" {
  provisioner "local-exec" {
    command = "wget https://storage.googleapis.com/istio-release/releases/1.9.5/sources.tar.gz"
  }
  # Delete on_destroy
  provisioner "local-exec" {
    when    = destroy
    command = "rm -f sources.tar.gz"
  }
}

resource "null_resource" "extract_istio" {
  provisioner "local-exec" {
    command = "tar -xvzf sources.tar.gz"
  }
  depends_on = [
    null_resource.download_istio
  ]
  # Delete on_destroy
  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf sources"
  }
}

resource "helm_release" "base" {
  name             = "${var.name_prefix}-istio-base"
  repository       = "sources/istio/manifests/charts/"
  chart            = "base"
  namespace        = var.namespace
  wait             = true
  create_namespace = true
  lint             = true
  values           = var.base_values
  depends_on = [
    null_resource.extract_istio
  ]
}

resource "helm_release" "istio-discovery" {
  name             = "${var.name_prefix}-istio-discovery"
  repository       = "sources/istio/manifests/charts/istio-control"
  chart            = "istio-discovery"
  namespace        = var.namespace
  wait             = true
  create_namespace = true
  lint             = true
  values           = var.discovery_values
  depends_on = [
    null_resource.extract_istio, helm_release.base
  ]
}

resource "helm_release" "istio-ingress" {
  name             = "${var.name_prefix}-istio-ingress"
  repository       = "sources/istio/manifests/charts/gateways"
  chart            = "istio-ingress"
  namespace        = var.namespace
  wait             = true
  create_namespace = true
  lint             = true
  values           = var.ingress_values
  depends_on = [
    null_resource.extract_istio, helm_release.istio-discovery
  ]
}
