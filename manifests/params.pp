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
  $package_source_location = 'https://www.nsclient.org/files/stable'
  $package_name            = 'NSClient++ (x64)'
  $package_source          = 'NSCP-0.4.1.101-x64.msi'
  $download_destination    = "c:\\temp"
  $config_template         = 'nsclient/nsclient.ini.erb'
  $proxy_server            = ''
}
