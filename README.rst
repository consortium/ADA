|Gitter| |Status| |License| |Build| 

ADA Infrastructure
==================

This is the ADA-Infrastructure repository to create a publishing microservice landscape in different platforms. First supported platform will be the Google Cloud (GCP).

This is Infrastructure-as-code (IaaC) and can be executed on any workstation to fold up a ADA service mesh on a cloud provider.

    Warning: Executing this will create costs for you !

Requirements
------------

- A Linux workstation
- Hashicorp Terraform [1]_
- A Google Cloud Account [2]_
- Google Cloud SDK [3]_
- Git [4]_
- Git-crypt [5]_


Get started
-----------

After Creating a GCP account and installing all requirements, you need to initialize the project. This initialization process creates all necessary state files and builds required software (container images).

Clone the repository
''''''''''''''''''''

Open a terminal and execute following line:

.. code-block:: shell

    git@github.com:consortium/ADA_infra.git

This utilizes git for cloning the repository from github to your local machine.


Initialize configuration
''''''''''''''''''''''''

.. code-block:: shell

    make config

License
-------

See License file in this directory.

Footnotes
---------

.. [1] https://www.terraform.io/
.. [2] https://cloud.google.com
.. [3] https://cloud.google.com/sdk/
.. [4] https://git-scm.com/
.. [5] https://github.com/AGWA/git-crypt
