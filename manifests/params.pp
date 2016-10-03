# Author::    Paul Stack  (mailto:pstack@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class nsclient::params
#
# This privaye class is meant to be called from `nsclient`
# It sets variables according to platform
#
class nsclient::params {
  $allowed_hosts           = []
  $service_state           = 'running'
  $service_enable          = true
  $package_source_location = 'https://github.com/mickem/nscp/releases/download/0.4.4.19'
  $package_name            = 'NSClient++ (x64)'
  $package_source          = 'NSCP-0.4.4.19-x64.msi'
  $download_destination    = 'c:/temp'
  $config_template         = 'nsclient/nsclient.ini.erb'
  $install_path            = 'C:\Program Files\NSClient++'
}
