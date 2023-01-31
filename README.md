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
<!-- END_TF_DOCS -->

