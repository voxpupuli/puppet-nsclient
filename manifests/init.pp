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
#
# [*download_destination*]
#   This is the folder to where we need to download the NSCP Installer. Package cannot take a remote file source
#   Because of Windows, we need to set this to be a top level directory (e.g. c:\\temp) or we would need to
#   recursively check the file path.
#
# [*config_template*]
#   This is the template to use as the config file.
#
class nsclient (
  $allowed_hosts           = $nsclient::params::allowed_hosts,
  $service_state           = $nsclient::params::service_state,
  $service_enable          = $nsclient::params::service_enable,
  $package_source_location = $nsclient::params::package_source_location,
  $package_source          = $nsclient::params::package_source,
  $package_name            = $nsclient::params::package_name,
  $download_destination    = $nsclient::params::download_destination,
  $config_template         = $nsclient::params::config_template
) inherits nsclient::params {

  validate_string($package_source_location)
  validate_string($package_source)
  validate_string($package_name)
  validate_string($config_template)

  class {'nsclient::install':} ->
  class {'nsclient::service':} ->
  Class['nsclient']

}
