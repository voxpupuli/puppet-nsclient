# == Class: nscient::paramrs
#
# Defaut parameter values for the nsclient module

class nsclient::params {
  $allowed_hosts           = []
  $service_state           = 'running'
  $service_enable          = true
  $package_source_location = 'http://files.nsclient.org/stable'
  $package_name            = 'NSClient++ (x64)'
  $package_source          = 'NSCP-0.4.1.101-x64.msi'
  $download_destination    = "c:\\temp"
  $config_template         = 'nsclient/nsclient.ini.erb'
}
