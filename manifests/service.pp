# == Class: nsclient::service
#
# Class to manage the nsclient service
#
# === Parameters
# [*package_name*]
#   Which package we need to actuall install. PackageNames are usually GUIDs in MS World

class nsclient::service(
  $service_state        = $nsclient::service_state,
  $service_enable       = $nsclient::service_enable,
  $package_name         = $nsclient::package_name
) {

  case $::osfamily {
    'Windows': {
      file { 'C:\Program Files\NSClient++\nsclient.ini':
        ensure  => file,
        owner   => 'SYSTEM',
        mode    => '0664',
        content => template('application_nscp/nsclient.ini.erb'),
        notify  => Service['nscp'],
        require => Package[$package_name]
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