<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_nsxt"></a> [nsxt](#requirement\_nsxt) | ~>3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nsxt"></a> [nsxt](#provider\_nsxt) | 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nsxt_policy_lb_pool.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_lb_pool) | resource |
| [nsxt_policy_lb_service.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_lb_service) | resource |
| [nsxt_policy_lb_virtual_server.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_lb_virtual_server) | resource |
| [nsxt_policy_lb_app_profile.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/data-sources/policy_lb_app_profile) | data source |
| [nsxt_policy_tier1_gateway.this](https://registry.terraform.io/providers/vmware/nsxt/latest/docs/data-sources/policy_tier1_gateway) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_error_log_level"></a> [error\_log\_level](#input\_error\_log\_level) | The logging level for the load balancer service. | `string` | `"ERROR"` | no |
| <a name="input_hosts"></a> [hosts](#input\_hosts) | The hosts to register as Boundary targets. | <pre>list(object({<br>    hostname = string<br>    address  = string<br>  }))</pre> | n/a | yes |
| <a name="input_lb_app_profile_display_name"></a> [lb\_app\_profile\_display\_name](#input\_lb\_app\_profile\_display\_name) | The id of the load balancer application profile to use. | `string` | `""` | no |
| <a name="input_lb_app_profile_id"></a> [lb\_app\_profile\_id](#input\_lb\_app\_profile\_id) | The id of the load balancer application profile to use. | `string` | `""` | no |
| <a name="input_lb_app_profile_type"></a> [lb\_app\_profile\_type](#input\_lb\_app\_profile\_type) | The type of traffic to be load balanced. Must be one of HTTP, TCP, UDP, or ANY. | `string` | `""` | no |
| <a name="input_load_balancer_enabled"></a> [load\_balancer\_enabled](#input\_load\_balancer\_enabled) | Whether the load balancer service is enabled. | `bool` | `true` | no |
| <a name="input_load_balancer_ip_address"></a> [load\_balancer\_ip\_address](#input\_load\_balancer\_ip\_address) | The IP address for the load balancer listener. | `string` | n/a | yes |
| <a name="input_load_balancer_size"></a> [load\_balancer\_size](#input\_load\_balancer\_size) | The size of the load balancer service to create. | `string` | `"SMALL"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to use for configured resources. | `string` | n/a | yes |
| <a name="input_ports"></a> [ports](#input\_ports) | The list of ports that the load balancer should listen on. | `list(number)` | n/a | yes |
| <a name="input_snat_type"></a> [snat\_type](#input\_snat\_type) | value | `string` | `"AUTOMAP"` | no |
| <a name="input_tier1_gateway"></a> [tier1\_gateway](#input\_tier1\_gateway) | The Tier1 gateway where the load balancer will be created. | `string` | `"Tier1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->