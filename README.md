# Terraform Logging for Oracle Cloud Infrastructure

The [Terraform Logging][repo] for [Oracle Cloud Infrastructure][OCI] provides a reusable [Terraform][terraform] module that provisions logging resource on OCI.

It creates the following resources:

* Loggroups and logs for supported OCI service
* Loggroups,logs and unified agent configuration for custom logs.
* Parser types are defined with default values.Additional parser details like regex expression ,grok pattern and other parser options are not supported now.

## [Documentation][docs]

### [Pre-requisites][prerequisites]

#### Instructions

* [Quickstart][quickstart]
* [Reusing as a Terraform module][reuse]
* [Terraform Options][terraform_options]

## Related Documentation, Blog

* [Oracle Cloud Infrastructure Documentation][oci_documentation]
* [Terraform OCI Provider Documentation][terraform_oci]


## Changelog

View the [CHANGELOG][changelog].

## Contributors

[Folks who contributed with explanations, code, feedback, ideas, testing etc.][contributors]

Learn how to [contribute][contributing].

## License

Copyright (c) 2019, 2021 Oracle and/or its associates.

Licensed under the [Universal Permissive License 1.0][license] as shown at
[https://oss.oracle.com/licenses/upl][canonical_license].

<!-- Links reference section -->
[changelog]: https://github.com/oracle-terraform-modules/terraform-oci-logging/blob/main/CHANGELOG.adoc
[contributing]: https://github.com/oracle-terraform-modules/terraform-oci-logging/blob/main/CONTRIBUTING.adoc
[contributors]: https://github.com/oracle-terraform-modules/terraform-oci-logging/blob/main/CONTRIBUTORS.adoc
[docs]: https://github.com/oracle-terraform-modules/terraform-oci-logging/tree/main/docs

[license]: https://github.com/oracle-terraform-modules/terraform-oci-logging/blob/main/LICENSE
[canonical_license]: https://oss.oracle.com/licenses/upl/

[oci]: https://cloud.oracle.com/cloud-infrastructure
[oci_documentation]: https://docs.cloud.oracle.com/iaas/Content/home.htm

[oracle]: https://www.oracle.com
[prerequisites]: https://github.com/oracle-terraform-modules/terraform-oci-logging/blob/main/docs/prerequisites.adoc

[quickstart]: https://github.com/oracle-terraform-modules/terraform-oci-logging/blob/main/docs/quickstart.adoc
[repo]: https://github.com/oracle/terraform-oci-logging
[reuse]: https://github.com/oracle/terraform-oci-logging/examples
[terraform]: https://www.terraform.io
[terraform_oci]: https://www.terraform.io/docs/providers/oci/index.html
[terraform_options]: https://github.com/oracle-terraform-modules/terraform-oci-logging/blob/main/docs/terraformoptions.adoc
<!-- Links reference section -->