# Terraform Child Module Template

This terraform script provisions:
+ azure postresql Single Server with a database
+ private endpoint for postgresql server

Prerequisites:
+ VNet and Subnet already provisioned in Resource Group.

## How to use

All variable are set in [terraform.tfvars](terraform.tfvars) these should be changed for each application team.

Variables that would need to change are marked as `<change-me>`.

More detail on each variable can be found in the `Inputs` section below

## How do I connect to my new Azure PostgreSQL server?
As we are using a private endpoint with the postgres server to securely connect from on-prem, the fully qualified domain name will not be reachable until a dns record is set for it. (This is the same process as for the storage account).

Meanwhile the private ip can be used to connect. The private ip is an output from the terraform module, but it can also be looked up in th portal under the private endpoint resource.

To connect you can use your favorite IDE, SQL tool or command line.

### Oracle SQL Developer with PostgreSQL driver

	Username: <username>@<postgres-server-name>
	Password: <password>
	Hostname: <postgres-private-ip>:5432/<database-name>?sslmode=require&ssl=true
	Port: THIS IS EMPTY

## Providers

| Name | Version |
|------|---------|
| azurerm | 2.7.0 |

-----

<!-- BEGIN_TF_DOCS -->
[![FINOS - Incubating](https://cdn.jsdelivr.net/gh/finos/contrib-toolbox@master/images/badge-incubating.svg)](https://finosfoundation.atlassian.net/wiki/display/FINOS/Incubating)
![website build](https://github.com/finos/cfi-terraform-template-child-module/workflows/Docusaurus-website-build/badge.svg)

# terraform-provider-function

This terraform module produces blah

## Usage example
```hcl
module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = "5.3.0"
}
```

### Providers

No providers.

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.7.0 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_grow_enabled"></a> [auto\_grow\_enabled](#input\_auto\_grow\_enabled) | Enable auto grow for Azure postgres | `bool` | n/a | yes |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Number of days to retain backups | `number` | n/a | yes |
| <a name="input_database_login"></a> [database\_login](#input\_database\_login) | Login for the database | `string` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name for database in postgres | `string` | n/a | yes |
| <a name="input_database_password"></a> [database\_password](#input\_database\_password) | Password for the database | `string` | n/a | yes |
| <a name="input_geo_redundent_enabled"></a> [geo\_redundent\_enabled](#input\_geo\_redundent\_enabled) | Enable geo redundency for Azure postgres | `bool` | n/a | yes |
| <a name="input_postgres_location"></a> [postgres\_location](#input\_postgres\_location) | Location of postgres server | `string` | n/a | yes |
| <a name="input_postgres_name"></a> [postgres\_name](#input\_postgres\_name) | Name for postgres server | `string` | n/a | yes |
| <a name="input_postgres_resource_group_location"></a> [postgres\_resource\_group\_location](#input\_postgres\_resource\_group\_location) | Resource group location for potgresql server | `string` | n/a | yes |
| <a name="input_postgres_resource_group_name"></a> [postgres\_resource\_group\_name](#input\_postgres\_resource\_group\_name) | Resource group name for potgresql server | `string` | n/a | yes |
| <a name="input_postgres_resource_group_tags"></a> [postgres\_resource\_group\_tags](#input\_postgres\_resource\_group\_tags) | Resource group tags for potgresql server | `map(any)` | n/a | yes |
| <a name="input_postgres_tags"></a> [postgres\_tags](#input\_postgres\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | Version for postgres server | `string` | n/a | yes |
| <a name="input_private_endpoint_location"></a> [private\_endpoint\_location](#input\_private\_endpoint\_location) | Location for privete endpoint | `string` | n/a | yes |
| <a name="input_private_endpoint_name"></a> [private\_endpoint\_name](#input\_private\_endpoint\_name) | Private endpoint name | `string` | n/a | yes |
| <a name="input_private_service_connection_name"></a> [private\_service\_connection\_name](#input\_private\_service\_connection\_name) | Private service connection name | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Postres sku name (GP\_Gen5\_2) | `string` | n/a | yes |
| <a name="input_storagemb"></a> [storagemb](#input\_storagemb) | Database storage in megabytes | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | n/a | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Target vnet name | `string` | n/a | yes |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | Target resource group for vnet | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_dbname"></a> [dbname](#output\_dbname) | n/a |
| <a name="output_postgres_private_ip"></a> [postgres\_private\_ip](#output\_postgres\_private\_ip) | n/a |
| <a name="output_server_fqdn"></a> [server\_fqdn](#output\_server\_fqdn) | n/a |
| <a name="output_server_name"></a> [server\_name](#output\_server\_name) | n/a |
| <a name="output_username"></a> [username](#output\_username) | n/a |

### Resources

No resources.

## Installation

OS X & Linux:

```sh
npm install my-crazy-module --save
```

Windows:

```sh
edit autoexec.bat
```
## Development setup

Describe how to install all development dependencies and how to run an automated test-suite of some kind. Potentially do this for multiple platforms.

```sh
make install
npm test
```
## Roadmap

List the roadmap steps; alternatively link the Confluence Wiki page where the project roadmap is published.

1. Item 1
2. Item 2
3. ....

## Contributing

1. Fork it (<https://github.com/finos/cfi-terraform-template-child-module/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Read our [contribution guidelines](.github/CONTRIBUTING.md) and [Community Code of Conduct](https://www.finos.org/code-of-conduct)
4. Commit your changes (`git commit -am 'Add some fooBar'`)
5. Push to the branch (`git push origin feature/fooBar`)
6. Create a new Pull Request

\_NOTE:\_ Commits and pull requests to FINOS repositories will only be accepted from those contributors with an active, executed Individual Contributor License Agreement (ICLA) with FINOS OR who are covered under an existing and active Corporate Contribution License Agreement (CCLA) executed with FINOS. Commits from individuals not covered under an ICLA or CCLA will be flagged and blocked by the FINOS Clabot tool (or [EasyCLA](https://community.finos.org/docs/governance/Software-Projects/easycla)). Please note that some CCLAs require individuals/employees to be explicitly named on the CCLA.

*Need an ICLA? Unsure if you are covered under an existing CCLA? Email [help@finos.org](mailto:help@finos.org)*

## License

Copyright 2022 FINOS

Distributed under the
[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

SPDX-License-Identifier: [Apache-2.0](https://spdx.org/licenses/Apache-2.0)
<!-- END_TF_DOCS -->

