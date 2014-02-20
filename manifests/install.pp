class nsclient::install {



case $::architecture {
'x64': {
$file_name = 'nscp-0.4.1.101-x64.msi'
# .msi GUID is used instead of package name in order to handle upgrades
$package_name = '{B263D105-744D-49AA-A25C-B222BB40F29C}'
}
'x86', default: {
$file_name = 'ncsp-0.4.1.101-Win32.msi'
# .msi GUID is used instead of package name in order to handle upgrades
$package_name = '{8D2CD2C8-5DAB-47EB-98B9-33F103010BBA}'
}
}

if ! defined(File['C:\PuppetScripts']) {
file { 'C:\PuppetScripts':
  ensure => directory,
}
}

if ($::operatingsystem == 'windows') {
download_file { 'NSCP-install':
  url                    => "http://artifactory.otsql.opentable.com:8081/artifactory/puppet/windows/nsclient/4.1/${file_name}",
  destination_directory  => 'C:/PuppetScripts',
  proxyAddress           => hiera('proxy::client::proxy_server')
}

package { $package_name:
  ensure  => installed,
  source  => "C:\\PuppetScripts\\${file_name}",
  require => Download_file['NSCP-install'],
}


}
else {
fail('This module is only supported on Windows')
}


}