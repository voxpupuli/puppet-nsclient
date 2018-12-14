# Author::    Paul Stack  (mailto:pstack@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class: nsclient
#
# Module to install NSClient on Windows.
#
# === Requirements/Dependencies
#
# Currently reequires the puppetlabs/stdlib module on the Puppet Forge in
# order to validate much of the the provided configuration.
#
# === Parameters
#
# [*allowed_hosts*]
# Array of hosts that your client can communicate with. You can use netmasks (/ syntax) or * to create ranges.
#
# [*service_state*]
# Whether you want to nsclient service to start up. Defaults to running
#
# [*service_enable*]
# Whether you want to nsclient service to start up at boot. Defaults to true
#
# [*package_source_location*]
# This is the default site to download your package from (e.g. http://files.nsclient.org/stable)
#
# [*package_source*]
# This is the source name of the package to be downloaded
#
# [*package_name*]
# This is name of the package to download (e.g. NSCP-0.4.1.101-x64.msi)
#
# [*download_destination*]
# This is the folder to where we need to download the NSCP Installer. Package cannot take a remote file source
# Because of Windows, we need to set this to be a top level directory (e.g. c:\\temp) or we would need to
# recursively check the file path.
#
# [*config_template*]
# This is the template to use as the config file.
#
# [*password*]
# Password used to authenticate against server
# default to undef
# === Examples
#
# To install a different version:
#
#   class { 'nsclient':
#     package_source_location => 'http://myhost.com',
#     package_name            => 'NSClient++ (Win32)'
#     package_source          => '0.3.1.msi'
#   }
#
# In order to configure the nagios hosts to communicate with:
#
#   class { 'nsclient':
#     allowed_hosts => ['10.21.0.0/22','10.21.4.0/22'],
#   }
#
class nsclient (
  $allowed_hosts                = $nsclient::params::allowed_hosts,
  $service_state                = $nsclient::params::service_state,
  $service_enable               = $nsclient::params::service_enable,
  $package_source_location      = $nsclient::params::package_source_location,
  $package_source               = $nsclient::params::package_source,
  $package_name                 = $nsclient::params::package_name,
  $download_destination         = $nsclient::params::download_destination,
  $config_template              = $nsclient::params::config_template,
  $install_path                 = $nsclient::params::install_path,
  Optional[String[1]] $password = $nsclient::params::password
) inherits nsclient::params {

  validate_string($package_source_location)
  validate_string($package_source)
  validate_string($package_name)
  validate_string($config_template)
  validate_string($install_path)


  class {'::nsclient::install':}
  -> class {'::nsclient::service':}

}
