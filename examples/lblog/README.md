# Creating logs and loggroups for loadbalancer service 

[Terraform Variable Definition file]:https://www.terraform.io/docs/language/values/variables.html#variable-definitions-tfvars-files
[Input Variables]:https://www.terraform.io/docs/language/values/variables.html
[Local Values]:https://www.terraform.io/docs/language/values/locals.html
[Named Values]:https://www.terraform.io/docs/language/expressions/references.html
[docs/prerequisites]:https://github.com/oracle-terraform-modules/terraform-oci-logging/blob/main/docs/prerequisites.adoc
[docs/terraformoptions]:https://github.com/oracle-terraform-modules/terraform-oci-logging/blob/main/docs/terraformoptions.adoc
[Provisioning Infrastructure with Terraform]:https://www.terraform.io/docs/cli/run/index.html

This example illustrates how to use `terraform-oci-logging` module to create a log and loggroup for loadbalancer service

To use this example you need a existing loadbalancer to enable logs

- lbname

## Prerequisites

You will need to collect the following information before you start:

1. your OCI provider authentication values
2. a compartment OCID in which the present configuration will be created

For detailed instructions, see [docs/prerequisites]

## Using this example with Terraform CLI

Prepare one [Terraform Variable Definition file] named `terraform.tfvars` with the required authentication information.

*TIP: You can rename and configure `terraform.tfvars.example` from this example's folder.*

Then apply the example using the following commands:

```shell
> terraform init
> terraform plan
> terraform apply
```

See [Provisioning Infrastructure with Terraform] for more details about Terraform CLI and the available subcommands.