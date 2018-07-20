ADA Infrastructure
==================

This is the ADA-Infrastructure repository to create a publishing microservice landscape in different platforms. First supported platform will be the Google Cloud (GCP).

This is Infrastructure-as-code (IaaC) and can be executed on any workstation to fold up a ADA service mesh on a cloud provider.

    Warning: Executing this will create costs for you !

Requirements
------------

- A Linux workstation
- Hashicorp's Terraform
- A Google Cloud Account
- Gcloud suite

Get started
-----------

After Creating a GCP account and installing all requirements, you need to initialize the project. This initialization process creates all necessary state files and builds required software (container images).

    make init