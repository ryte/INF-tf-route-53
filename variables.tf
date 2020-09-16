variable "a_records" {
  type = map(object({
    name    = string
    records = list(string)
  }))
  description = "map of objects for A records"
  default     = {}
}

variable "a_alias_records" {
  type = map(object({
    name    = string
    record  = string
    zone_id = string
  }))
  description = "map of objects for A alias records"
  default     = {}
}

variable "cname_records" {
  type = map(object({
    name    = string
    records = list(string)
  }))
  description = "map of objects for CNAME records"
  default     = {}
}

variable "ttl" {
  type        = string
  description = "ttl"
  default     = "300"
}

variable "mx_records" {
  type        = list(string)
  description = "list of mx records with weight"
  default     = []
}

variable "srv_records" {
  type = map(object({
    name    = string
    records = list(string)
  }))
  description = "map of objects for SRV records"
  default     = {}
}

variable "txt_records" {
  type = map(object({
    name    = string
    records = list(string)
  }))
  description = "map of objects for TXT records"
  default     = {}
}

variable "zone_id" {
  type        = string
  description = "zone id of domain"
}

variable "ns_records" {
  type        = list(string)
  description = "list of ns records"
  default     = []
}
