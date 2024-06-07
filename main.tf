data "nsxt_policy_tier0_gateway" "this" {
  display_name = var.tier0_gateway
}

data "nsxt_policy_edge_cluster" "this" {
  display_name = var.edge_cluster
}

resource "nsxt_policy_tier1_gateway" "this" {
  display_name = "${var.name}-lb"
  tier0_path = data.nsxt_policy_tier0_gateway.this.path
  pool_allocation = upper(var.pool_allocation)
  edge_cluster_path = data.nsxt_policy_edge_cluster.this.path
}

data "nsxt_policy_lb_app_profile" "this" {
  id           = var.lb_app_profile_id != "" ? var.lb_app_profile_id : null
  display_name = var.lb_app_profile_display_name != "" ? var.lb_app_profile_display_name : null
  type         = var.lb_app_profile_type != "" ? var.lb_app_profile_type : null
  lifecycle {
    # --- Workaround for multiple variable validation.
    precondition {
      condition = anytrue([
        var.lb_app_profile_id != "",
        var.lb_app_profile_type != "",
        var.lb_app_profile_display_name != ""
      ])
      error_message = "At least one of the following variables must be set: lb_app_profile_id, lb_app_profile_display_name, lb_app_profile_type."
    }
  }
}

resource "nsxt_policy_lb_service" "this" {
  display_name      = var.name
  connectivity_path = nsxt_policy_tier1_gateway.this.path
  size              = var.load_balancer_size
  error_log_level   = var.error_log_level
  enabled           = var.load_balancer_enabled
}

resource "nsxt_policy_lb_pool" "this" {
  display_name       = var.name
  min_active_members = 1
  dynamic "member" {
    # --- Construct a new object so that we create a member per host per port.
    for_each = flatten([for host in var.hosts : [for port in toset(var.ports) : { "hostname" = host.hostname, "address" = host.address, "port" = port }]])
    content {
      admin_state                = "ENABLED"
      backup_member              = false
      display_name               = member.value.hostname
      ip_address                 = member.value.address
      max_concurrent_connections = 12
      port                       = member.value.port
      weight                     = 1
    }
  }
  snat {
    type = var.snat_type
  }
}

resource "nsxt_policy_lb_virtual_server" "this" {
  display_name             = var.name
  ports                    = var.ports
  application_profile_path = data.nsxt_policy_lb_app_profile.this.path
  ip_address               = var.load_balancer_ip_address
  pool_path                = nsxt_policy_lb_pool.this.path
  service_path             = nsxt_policy_lb_service.this.path
}