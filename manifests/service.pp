# Author::    Paul Stack  (mailto:pstack@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class: nsclient::service
#
# This private class is meant to be called from `nsclient`.
# It manages the nsclient service
#
class nsclient::service(
  $service_state   = $nsclient::service_state,
  $service_enable  = $nsclient::service_enable,
  $allowed_hosts   = $nsclient::allowed_hosts,
  $config_template = $nsclient::config_template,
  $install_path    = $nsclient::install_path,
  $password        = $nsclient::password
) {

  assert_private("You're not supposed to do that!")

  case downcase($::osfamily) {
    'windows': {
      file { "${install_path}\\nsclient.ini":
        ensure  => file,
        owner   => 'SYSTEM',
        content => template($config_template),
        notify  => Service['nscp'],
      }

      service { 'nscp':
        ensure  => $service_state,
        enable  => $service_enable,
        require => File["${install_path}\\nsclient.ini"],
      }
    }
    default: {
      fail('This module only works on Windows based systems.')
    }
  }
}
