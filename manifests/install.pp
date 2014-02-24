# == Class: nsclient::install
#
# Class to install the nsclient msi

class nsclient::install {

  validate_string($nsclient::package_source_location)
  validate_string($nsclient::package_name)

  $source = "${nsclient::package_source_location}/${nsclient::package_name}"

  case downcase($::osfamily) {
    'windows': {
      package { $nsclient::package_name:
        ensure   => installed,
        source   => $source,
        provider => 'msi'
      }
    }
    default: {
      fail('This module only works on Windows based systems.')
    }
  }
}
