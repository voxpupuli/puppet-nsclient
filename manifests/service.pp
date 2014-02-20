# == Class: nsclient::service
#
# Class to manage the nsclient service

class nsclient::service(
  $service_state  = $nsclient::service_state,
  $service_enable = $nsclient::service_enable
) {

  case $::osfamily {
    'Windows': {
      file { 'C:\Program Files\NSClient++\nsclient.ini':
        ensure  => file,
        owner   => 'SYSTEM',
        mode    => '0664',
        content => template('nsclient/nsclient.ini.erb'),
        notify  => Service['nscp']
      }

      service { 'nscp':
        ensure  => $service_state,
        enable  => $service_enable,
        require => File['C:\Program Files\NSClient++\nsclient.ini'],
      }
    }
    default: {
      fail('NSClient needs a Windows based system.')
    }
  }
}