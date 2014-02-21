Puppet-NSClient
============================

This is a module that will manage and install the NSClient on Windows servers. 

[![Build Status](https://travis-ci.org/opentable/puppet-nsclient.png?branch=master)](https://travis-ci.org/opentable/puppet-nsclient)

Usage
--
The module consists of a single class

```puppet  
include 'nsclient'
```

By default, this will install the latest stable build (0.4.1.101) of the nsclient for x64 machines. If you want to install a different version, then you can tell the module to do so:

```puppet
class { 'nsclient':
  package_source_location => 'http://myhost.com',
  package_version         => '0.3.1.msi'
}
```

