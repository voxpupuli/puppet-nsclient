# == Class: nscient::paramrs
#
# Defaut parameter values for the nsclient module
#
class nsclient::params {
  $version        = undef
  $package_name   = undef
  $allowed_hosts  = undef
  $service_state  = running
  $service_enable = true
}