##2014-10-10 - Release 1.2.0
###Summary

  Bringing module up to higher quality standard with documentation and tests

####Features

- Switching default download to https
- Improving documentation
- Improving tests

##2014-04-25 - Release 1.1.0
###Summary

  Adding support for custom configurations.

####Features
 - Adding param `config_template` to allow you to specify custom templates
 - Improving documentation
 - Improving tests

##2014-04-22 - Release 1.0.0
###Summary

  Bugfix release. Fixes issue with differently named msi packages.

####Bugfixes
 - Adding parameter `package_source` which fixes bug where the package_name doesn't match the msi name

##2014-02-24 - Release 0.0.2
###Summary

  Bugfix release. Updating to use new windows package provider.

####Bugfixes
 - Fixing the case sensitivity of the osfamily fact
 - Switching to windows provider and adding support to download the package with download_file
 - Fixing duplicate resource issue with download_destination

##2014-02-21 - Release 0.0.1
###Summary

  Initial release. Support for installing nsclient
