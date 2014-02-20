# == Class: nscient::paramrs
#
# Defaut parameter values for the nsclient module
#
class nsclient::params {
  $allowed_hosts           = undef
  $service_state           = 'running'
  $service_enable          = true
  $package_source_location = 'http://files.nsclient.org/stable'
  $package_version         = 'NSCP-0.4.1.101-x64.msi'
}