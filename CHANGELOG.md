# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v2.1.0](https://github.com/voxpupuli/puppet-nsclient/tree/v2.1.0) (2019-01-04)

[Full Changelog](https://github.com/voxpupuli/puppet-nsclient/compare/v2.0.1...v2.1.0)

**Implemented enhancements:**

- Add password field [\#16](https://github.com/voxpupuli/puppet-nsclient/issues/16)
- Add chocolatey as a provider for installing the package [\#63](https://github.com/voxpupuli/puppet-nsclient/pull/63) ([hdep](https://github.com/hdep))
- Add password variable [\#61](https://github.com/voxpupuli/puppet-nsclient/pull/61) ([hdep](https://github.com/hdep))
- Add proxy support [\#58](https://github.com/voxpupuli/puppet-nsclient/pull/58) ([hdep](https://github.com/hdep))

**Fixed bugs:**

- download\_file should not happen when chocolatey is used [\#66](https://github.com/voxpupuli/puppet-nsclient/pull/66) ([hdep](https://github.com/hdep))
- remove 'mode'  because it is not manage correctly by puppet on windows [\#65](https://github.com/voxpupuli/puppet-nsclient/pull/65) ([hdep](https://github.com/hdep))

**Closed issues:**

- This plugin should not use mode  [\#64](https://github.com/voxpupuli/puppet-nsclient/issues/64)
- Allow nsclient install from chocolatey provider [\#59](https://github.com/voxpupuli/puppet-nsclient/issues/59)
- Add support for proxy [\#57](https://github.com/voxpupuli/puppet-nsclient/issues/57)

**Merged pull requests:**

- Add 'FILE MANAGED BY PUPPET' header to template [\#60](https://github.com/voxpupuli/puppet-nsclient/pull/60) ([hdep](https://github.com/hdep))
- Remove Linux acceptance nodesets [\#56](https://github.com/voxpupuli/puppet-nsclient/pull/56) ([ekohl](https://github.com/ekohl))
- modulesync 2.2.0 and allow puppet 6.x [\#55](https://github.com/voxpupuli/puppet-nsclient/pull/55) ([bastelfreak](https://github.com/bastelfreak))
-  replace validate\_\* with datatypes/assert\_type [\#40](https://github.com/voxpupuli/puppet-nsclient/pull/40) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.1](https://github.com/voxpupuli/puppet-nsclient/tree/v2.0.1) (2018-09-07)

[Full Changelog](https://github.com/voxpupuli/puppet-nsclient/compare/v2.0.0...v2.0.1)

**Merged pull requests:**

- allow puppetlabs/stdlib 5.x [\#50](https://github.com/voxpupuli/puppet-nsclient/pull/50) ([bastelfreak](https://github.com/bastelfreak))
- Remove docker nodesets [\#46](https://github.com/voxpupuli/puppet-nsclient/pull/46) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#45](https://github.com/voxpupuli/puppet-nsclient/pull/45) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.0](https://github.com/voxpupuli/puppet-nsclient/tree/v2.0.0) (2018-03-11)

[Full Changelog](https://github.com/voxpupuli/puppet-nsclient/compare/v1.4.0...v2.0.0)

**Fixed bugs:**

- Fixes \#17 - Updating the location of the file download. [\#36](https://github.com/voxpupuli/puppet-nsclient/pull/36) ([andrewwippler](https://github.com/andrewwippler))
- fix \#32 use package install\_options hash [\#34](https://github.com/voxpupuli/puppet-nsclient/pull/34) ([derektamsen](https://github.com/derektamsen))

**Closed issues:**

- Install\_options not working on newer versions of nsclient. [\#32](https://github.com/voxpupuli/puppet-nsclient/issues/32)
- download location broken [\#17](https://github.com/voxpupuli/puppet-nsclient/issues/17)

# Changelog

## [v1.4.0](https://github.com/voxpupuli/puppet-nsclient/tree/v1.4.0) (2017-02-11)

This is the last release with Puppet3 support
* rubocop: fix RSpec/ImplicitExpect
* Set min version_requirement for Puppet + deps
* Fix tests for future parser
* Add parameter to change installation directory
* Default download_destination to use forward slashes

## 2014-10-13 - Release 1.3.0
### Summary

  Updating dowload_file dependency to latest version

## 2014-10-13 - Release 1.2.1
### Summary

  Fixing broken dowload_file dependency

## 2014-10-10 - Release 1.2.0
### Summary

  Bringing module up to higher quality standard with documentation and tests

#### Features

- Switching default download to https
- Improving documentation
- Improving tests

## 2014-04-25 - Release 1.1.0
### Summary

  Adding support for custom configurations.

#### Features
 - Adding param `config_template` to allow you to specify custom templates
 - Improving documentation
 - Improving tests

## 2014-04-22 - Release 1.0.0
### Summary

  Bugfix release. Fixes issue with differently named msi packages.

#### Bugfixes
 - Adding parameter `package_source` which fixes bug where the package_name doesn't match the msi name

## 2014-02-24 - Release 0.0.2
### Summary

  Bugfix release. Updating to use new windows package provider.

#### Bugfixes
 - Fixing the case sensitivity of the osfamily fact
 - Switching to windows provider and adding support to download the package with download_file
 - Fixing duplicate resource issue with download_destination

## 2014-02-21 - Release 0.0.1
### Summary

  Initial release. Support for installing nsclient


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
