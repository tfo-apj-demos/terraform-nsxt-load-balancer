variable "name" {
  type        = string
  description = "The name to use for configured resources."
}

variable "tier0_gateway" {
  type = string
  description = "The Tier0 gateway to attach the T1 gateway to."
  default = "Provider-LR"
}

variable "edge_cluster" {
  type = string
  description = ""
  default = "edge-cluster"
}

variable "pool_allocation" {
  type = string
  description = ""
  default = "LB_SMALL"
  validation {
    condition     = contains(["LB_SMALL", "LB_MEDIUM", "LB_LARGE", "LB_XLARGE"], upper(var.pool_allocation))
    error_message = "Value must be one of LB_SMALL, LB_MEDIUM, LB_LARGE, LB_XLARGE."
  }
}

variable "lb_app_profile_id" {
  type        = string
  description = "The id of the load balancer application profile to use."
  default     = ""
}

variable "lb_app_profile_display_name" {
  type        = string
  description = "The id of the load balancer application profile to use."
  default     = ""
}

variable "lb_app_profile_type" {
  type        = string
  description = "The type of traffic to be load balanced. Must be one of HTTP, TCP, UDP, or ANY."
  default     = ""
}

variable "ports" {
  type        = list(number)
  description = "The list of ports that the load balancer should listen on."
}

variable "load_balancer_size" {
  type        = string
  description = "The size of the load balancer service to create."
  default     = "SMALL"
}

variable "error_log_level" {
  type        = string
  description = "The logging level for the load balancer service."
  default     = "ERROR"
}

variable "load_balancer_enabled" {
  type        = bool
  description = "Whether the load balancer service is enabled."
  default     = true
}

variable "hosts" {
  type = list(object({
    hostname = string
    address  = string
  }))
  description = "The hosts to register as Boundary targets."
}

variable "load_balancer_ip_address" {
  type        = string
  description = "The IP address for the load balancer listener."
}

variable "snat_type" {
  type        = string
  description = "value"
  default     = "AUTOMAP"
  validation {
    condition     = contains(["AUTOMAP", "DISABLED", "IPPOOL"], var.snat_type)
    error_message = "Value must be one of AUTOMAP, DISABLED, IPPOOL."
  }
}
