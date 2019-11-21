variable "a_records" {
  type        = map(string)
  description = "list of hostnames and targets"
  default     = {}
}

variable "a_alias_records" {
  type        = map(string)
  description = "list of hostnames and targets"
  default     = {}
}

variable "cname_records" {
  type        = map(string)
  description = "list of hostnames and targets"
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
  type        = map(string)
  description = "list of hostnames and targets"
  default     = {}
}

variable "txt_records" {
  type        = map(string)
  description = "list of hostnames and targets"
  default     = {}
}

variable "txt_record_root" {
  type        = list(string)
  description = "list of TXT entries which will be set for the root domain"
  default     = []
}

variable "zone_id" {
  type        = string
  description = "zone id of domain"
}

