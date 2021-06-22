# terraform-k8s-istio

A combinator component that installs [Istio](https://istio.io).

## Usage

Note that this installation includes limits, so you will need nodes big enough to fit istio, or have autoscaling enabled.

```terraform
module "istio" {
  source  = "combinator-ml/istio/k8s"
}
```

See the full configuration options below.

Once installed, you can test your installation with the [default Istio example](https://istio.io/latest/docs/setup/getting-started/#bookinfo).

## Requirements

| Name | Version |
|------|---------|
| provider | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| null | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| base\_values | Istio base Helm values | `list(string)` | `[]` | no |
| discovery\_values | Istio discovery Helm values | `list(string)` | `[]` | no |
| enable\_default\_control\_plane | Whether to install a default control plane | `bool` | `true` | no |
| ingress\_values | Istio ingress Helm values | `list(string)` | `[]` | no |
| name\_prefix | Prefix to be used when installing. | `string` | `"combinator"` | no |
| namespace | The namespace to install into. | `string` | `"istio-system"` | no |

## Outputs

No output.
