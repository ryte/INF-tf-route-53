variable "a_records" {
  type = "map"
  description = "list of hostnames and targets"
  default = {}
}

variable "a_alias_records" {
  type = "map"
  description = "list of hostnames and targets"
  default = {}
}

variable "cname_records" {
  type = "map"
  description = "list of hostnames and targets"
  default = {}
}

variable "ttl" {
  type = "string"
  description = "ttl"
  default = "300"
}

variable "mx_records" {
  type = "list"
  description = "list of mx records with weight"
  default = []
}

variable "txt_records" {
  type = "map"
  description = "list of hostnames and targets"
  default = {}
}

variable "zone_id" {
  type = "string"
  description = "zone id of domain"
}