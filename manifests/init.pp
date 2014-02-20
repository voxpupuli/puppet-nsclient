class nsclient (
  $allowed_hosts = $nsclient::params::allowed_hosts
) inherits nsclient::params {

  validate_re($::osfamily, '^(Windows)$', 'This module only works on Windows based systems.')

  class {'nsclient::install':} ->
  class {'nsclient::service':} ->
  Class['nsclient']

}
