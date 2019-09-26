# INF-tf-route-53

Terraform module for configuring route 53 with maps


This project is [internal open source](https://en.wikipedia.org/wiki/Inner_source)
and currently maintained by the [INF](https://github.com/orgs/onpage-org/teams/inf).



## Usage

get the zone
```hcl
data "aws_route53_zone" "zone" {
  name = "${var.domain}."
}
```


```hcl
module "route_53" {
    zone_id = "${data.aws_route53_zone.zone.id}"
    ttl  = 300

    a_records = {
        1 = {
            name    = ""
            records = ["1.2.3.4"]
        }
    }

    a_alias_records = {
        1 = {
            name    = "name"
            record  = "target"
            zone_id = "taret zone id"
        }
    }

    cname_records = {
        1 = {
            name    = "name"
            records = ["foo.bar"]
        }
    }

    txt_records = {
        root = {
          name = ""
          records = ["record"]
        }
        1 = {
          name    = "name"
          records = ["record"]
        }
    }

    mx_records = [
        "1 aspmx.l.google.com",
        "5 alt2.aspmx.l.google.com",
        "5 alt1.aspmx.l.google.com",
        "10 aspmx2.googlemail.com",
        "10 aspmx3.googlemail.com",
    ]

    source = "git@github.com:onpage-org/INF-tf-route-53.git?ref=v0.2.0"
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Required Inputs

The following input variables are required:

### zone\_id

Description: zone id of domain

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### a\_alias\_records

Description: list of hostnames and targets

Type: `object`

Default: `<map>`

### a\_records

Description: list of hostnames and targets

Type: `object`

Default: `<map>`

### cname\_records

Description: list of hostnames and targets

Type: `object`

Default: `<map>`

### mx\_records

Description: list of mx records with weight

Type: `list(string)`

Default: `<list>`

### srv\_records

Description: list of hostnames and targets

Type: `object`

Default: `<map>`

### ttl

Description: ttl

Type: `string`

Default: `"300"`

### txt\_records

Description: list of hostnames and targets

Type: `object`

Default: `<map>`

## Outputs

The following outputs are exported:

### a\_alias\_records

Description:

### a\_records

Description:

### cname\_records

Description:

### mx\_records

Description:

### srv\_records

Description:

### txt\_records

Description:

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

- [Armin Grodon](https://github.com/x4121)
- [Markus Schmid](https://github.com/h0raz)

## Changelog

0.2.0 - Upgrade to terraform 0.12.x
0.1.2 - Update output variable of all records
0.1.1 - Separate variable for TXT records for root domain
0.1.0 - Initial release.

## License


This software is released under the MIT License (see `LICENSE`).
