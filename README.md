# INF-tf-route-53

Terraform module for configuring route 53 with maps


This project is [internal open source](https://en.wikipedia.org/wiki/Inner_source)
and currently maintained by the [INF](https://github.com/orgs/onpage-org/teams/inf).

## Module Input Variables


- `a_records`
    -  __description__: list of hostnames and targets
    -  __type__: `map`
    -  __default__: {}

- `a_alias_records`
    -  __description__: list of hostnames and targets
    -  __type__: `map`
    -  __default__: {}

- `cname_records`
    -  __description__: list of hostnames and targets
    -  __type__: `map`
    -  __default__: {}

- `domain`
    -  __description__: domain where to add the records
    -  __type__: `string`

- `ttl`
    -  __description__: time to live for all records
    -  __type__: `string`
    -  __default__: "300"

- `srv_records`
    -  __description__: list of hostnames and targets
    -  __type__: `map`
    -  __default__: {}

- `txt_records`
    -  __description__: list of hostnames and targets
    -  __type__: `map`
    -  __default__: {}

- `txt_record_root`
    -  __description__: txt_record_root
    -  __type__: `list`
    -  __default__: []

- `zone_id`
    -  __description__: route 53 zone id
    -  __type__: `string`


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
        ""    = "1.2.3.4"
        "www" = "2.3.4.5"
    }

    a_alias_records = {
        "www" = "some ALB name"
    }

    cname_records = {
        "de"  = "en.ryte.com"
    }

    txt_records = {
        ""      = "Hello World"
        "multi" = "comma,separated,with,no,space"
    }

    mx_records = [
        "1 aspmx.l.google.com",
        "5 alt2.aspmx.l.google.com",
        "5 alt1.aspmx.l.google.com",
        "10 aspmx2.googlemail.com",
        "10 aspmx3.googlemail.com",
    ]

    source = "github.com/onpage-org/INF-tf-route-53.git?ref=v0.1.1"
}
```

## Outputs

- `a_records`
    -  __description__: list of A records
    -  __type__: `list`

- `a_alias_records`
    -  __description__: list of ALIAS records
    -  __type__: `list`

- `cname_records`
    -  __description__: list of CNAME records
    -  __type__: `list`

- `srv_records`
    -  __description__: list of SRV records
    -  __type__: `list`

- `txt_records`
    -  __description__: list of TXT records
    -  __type__: `list`

- `txt_record_root`
    -  __description__: txt_record_root
    -  __type__: `list`

## Authors

- [Armin Grodon](https://github.com/x4121)
- [Markus Schmid](https://github.com/h0raz)

## Changelog

- 0.1.2 - Update output variable of all records
- 0.1.1 - Separate variable for TXT records for root domain
- 0.1.0 - Initial release.

## License

This software is released under the MIT License (see `LICENSE`).
