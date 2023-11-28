variable "name" {
  type        = string
  description = "The name to use for configured resources."
}

variable "tier1_gateway" {
  type        = string
  description = "The Tier1 gateway where the load balancer will be created."
  default     = "Tier1"
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
