# PoSH-OpsGenieV2
### OpsGenie Powershell APIv2 Wrapper.

For all companies and teams that are utilizing OpsGenie as their alerting system, this module is a great helper.
Some of the common applicable situations for the use:
  1. Integration with your own monitoring system, sending alerts via Powershell to OpsGenie.
  2. Integration with existing Powershell code, like the functions running on Microsoft Azure.

### Importing the module
  After downloading the git repo, you can easily import the module by running below sequence of commands.
```powershell
Copy-Item -Recurse PoSH-OpsGeniev2 -Destination $PSHome\Modules\
Import-Module PoSH-OpsGeniev2
```
### Disclaimer:
  The module is still in its early stage, we're trying to develop every function thoroughly and carefully as possible.

