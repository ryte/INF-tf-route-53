# INF-tf-route-53

Terraform module for configuring route 53 with maps


This project is [internal open source](https://en.wikipedia.org/wiki/Inner_source)
and currently maintained by the [INF](https://github.com/orgs/ryte/teams/inf).

This project is using [pre-commit](https://pre-commit.com/) to generate parts
of the readme.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

The following requirements are needed by this module:

- terraform (>= 0.12)

## Providers

The following providers are used by this module:

- aws

## Required Inputs

The following input variables are required:

### zone\_id

Description: zone id of domain

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### a\_alias\_records

Description: map of objects for A alias records

Type:

```hcl
map(object({
    name    = string
    record  = string
    zone_id = string
  }))
```

Default: `{}`

### a\_records

Description: map of objects for A records

Type:

```hcl
map(object({
    name    = string
    records = list(string)
  }))
```

Default: `{}`

### aaaa\_alias\_records

Description: map of objects for AAAA alias records

Type:

```hcl
map(object({
    name    = string
    record  = string
    zone_id = string
  }))
```

Default: `{}`

### aaaa\_records

Description: map of objects for AAAA records

Type:

```hcl
map(object({
    name    = string
    records = list(string)
  }))
```

Default: `{}`

### cname\_records

Description: map of objects for CNAME records

Type:

```hcl
map(object({
    name    = string
    records = list(string)
  }))
```

Default: `{}`

### mx\_records

Description: list of mx records with weight

Type: `list(string)`

Default: `[]`

### ns\_records

Description: map of objects for NS records

Type:

```hcl
map(object({
    name    = string
    records = list(string)
  }))
```

Default: `{}`

### srv\_records

Description: map of objects for SRV records

Type:

```hcl
map(object({
    name    = string
    records = list(string)
  }))
```

Default: `{}`

### ttl

Description: ttl

Type: `string`

Default: `"300"`

### txt\_records

Description: map of objects for TXT records

Type:

```hcl
map(object({
    name    = string
    records = list(string)
  }))
```

Default: `{}`

## Outputs

The following outputs are exported:

### a\_alias\_records

Description: n/a

### a\_records

Description: n/a

### aaaa\_alias\_records

Description: n/a

### aaaa\_records

Description: n/a

### cname\_records

Description: n/a

### mx\_records

Description: n/a

### srv\_records

Description: n/a

### txt\_records

Description: n/a

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

get the zone
```hcl
data "aws_route53_zone" "zone" {
  name = "${var.domain}."
}
```


```hcl
module "route_53" {
    zone_id = data.aws_route53_zone.zone.id
    ttl  = 300

    a_records = {
        1 = {
            name    = ""
            records = ["1.2.3.4"]
        }
    }

    aaaa_records = {
        1 = {
            name    = ""
            records = ["1.2.3.4"]
        }
    }

    a_alias_records = {
        1 = {
            name    = "www"
            record  = "webservice-main-alb-123465789012.eu-central-1.elb.amazonaws.com"
            zone_id = "ABCDEFGHIJKLMN" // zone_id of the loadbalancer
        }
    }

    aaaa_alias_records = {
        1 = {
            name    = "www"
            record  = "webservice-main-alb-123465789012.eu-central-1.elb.amazonaws.com"
            zone_id = "ABCDEFGHIJKLMN" // zone_id of the loadbalancer
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
          records = ["v=spf1", "site-verification=dummy"]
        }
        1 = {
          name    = "name"
          records = ["domainkey=foo", "challenge=other"]
        }
    }

    mx_records = [
        "1 aspmx.l.google.com",
        "5 alt2.aspmx.l.google.com",
        "5 alt1.aspmx.l.google.com",
        "10 aspmx2.googlemail.com",
        "10 aspmx3.googlemail.com",
    ]

    ns_records = {
      1 = {
        name = "kite"
        records = [
          "ns-420.awsdns.com",
          "ns-69.awsdns.org",
          "ns-42069.awsdns.net",
        ]
      }
    }

    source = "github.com/ryte/INF-tf-route-53.git?ref=v0.3.1"
}
```

## Authors

- [Armin Grodon](https://github.com/x4121)
- [Markus Schmid](https://github.com/h0raz)
- [Alex Bershadsky](https://github.com/al-dexter)
- [Danny Linden](https://github.com/dannylinden)

## Changelog

- 0.3.1 - Add support for AAAA and AAAA Alias records
- 0.3.0 - Add support for creating NS records subdomain
- 0.2.1 - Utilize terraform 0.12.x features
- 0.2.0 - Upgrade to terraform 0.12.x
- 0.1.2 - Update output variable of all records
- 0.1.1 - Separate variable for TXT records for root domain
- 0.1.0 - Initial release.

## License

This software is released under the MIT License (see `LICENSE`).
