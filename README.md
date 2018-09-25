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

- `txt_records`
    -  __description__: list of hostnames and targets
    -  __type__: `map`
    -  __default__: {}

## Usage

get the zone
```hcl
data "aws_route53_zone" "zone" {
  name = "${var.domain}."
}
```


```hcl
module "route_53" {
    zone = "${data.aws_route53_zone.zone.id}"
    ttl  = 300

    a_records = {
        "www" = "1.2.3.4"
    }

    a_alias_records = {
        "www" = "some ALB name"
    }

    cname_records = {
        "de"  = "en.ryte.com"
    }

    txt_records = {
        "a"   = "Hello World"
    }

    mx_records = [
        "1 ASPMX.L.GOOGLE.COM",
        "5 ALT1.ASPMX.L.GOOGLE.COM",
        "5 ALT2.ASPMX.L.GOOGLE.COM",
        "10 ASPMX2.GOOGLEMAIL.COM",
        "10 ASPMX3.GOOGLEMAIL.COM",
    ]

    source = "git@github.com:onpage-org/INF-tf-route-53.git?ref=v0.1.0"
}
```

## Outputs

None

## Authors

- [Armin Grodon](https://github.com/x4121)
- [Markus Schmid](https://github.com/h0raz)

## Changelog

0.1.0 - Initial release.

## License


This software is released under the MIT License (see `LICENSE`).
