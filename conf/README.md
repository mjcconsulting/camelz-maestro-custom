# Configuration

This section will contain configuration files, mostly parameters files used to override the default values of parameters
defined within templates in the [Deployments](../deployments/) section, but also any other data files which may be used.

## WIP - Work in Progress

It's likely I will significantly rewrite this section for clarity - just dumping the main concepts of the structural
design in here quickly to help people understand this until I have time to improve it.

### Naming Conventions

See the file naming conventions defined in the `tenncare-azure-prototype` Configuration section.

**I'm describing my thought process in case anyone stumbles across this section in a partially designed state!**

## Network CIDRs

This section will show the CIDRs initially assigned to the VNets associated with each environment. These values are
temporary and almost certain to be changed, not only in value, but perhaps in size or assignment pattern.

| Name | Code | CIDR | Comment |
| --- | --- | --- | --- |
| Production | p | 172.16.0.0/16 | |
| Recovery | r | 172.17.0.0/16 | |
| Core | c | 172.18.0.0/16 | |
| Staging | s | 172.19.0.0/16 | |
| Testing | t | 172.20.0.0/16 | |
| Development | d | 172.21.0.0/16 | |
| Sandbox | x | 172.22.0.0/16 | Code `s` reserved for Staging, using `x` for sandboX / eXperiment |

## Configuration Types

The directory structure of the configuration section should have the same leading directory path as what is found within
the deployments directory structure, not including the deployment-scope top-level directory.

This is an index into this organization structure. This structure is initially sparse but will be increased over time.

* **[budgets](./budgets/)**  
  Configuration related to budgets.
* **[networks](./networks/)**  
  Configuration related to networking.
* **[storage-accounts](./storage-accounts/)**  
  Configuration related to storage accounts.
* **[tests](./tests/)**  
  Configuration related to tests.
