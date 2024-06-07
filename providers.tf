terraform {
  required_version = "~>1.7"
  required_providers {
    nsxt = {
      source  = "vmware/nsxt"
      version = "~>3"
    }
  }
}