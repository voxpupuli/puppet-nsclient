# == Class: nsclient
#
# Module to install NSClient on Windows.
#
# === Parameters
#
# [*allowed_hosts*]
#   Array of hosts that your client can communicate with. You can use netmasks (/ syntax) or * to create ranges.
#
# [*service_state*]
#   Whether you want to nsclient service to start up
#   Defaults to running
#
# [*service_enable*]
#   Whether you want to nsclient service to start up at boot
#   Defaults to true
#
# [*package_source_location*]
#   This is the default site to download your package from (e.g. http://files.nsclient.org/stable)
#
# [*package_name*]
#   This is name of the package to download (e.g. NSCP-0.4.1.101-x64.msi)

class nsclient (
  $allowed_hosts           = $nsclient::params::allowed_hosts,
  $service_state           = $nsclient::params::service_state,
  $service_enable          = $nsclient::params::service_enable,
  $package_source_location = $nsclient::params::package_source_location,
  $package_name            = $nsclient::params::package_name
) inherits nsclient::params {

  validate_re($::osfamily, '^(Windows)$', 'This module only works on Windows based systems.')
  validate_string($package_source_location)
  validate_string($package_name)

  class {'nsclient::install':} ->
  class {'nsclient::service':} ->
  Class['nsclient']

}
