Puppet-NSClient
============================

This is a module that will manage and install the NSClient on Windows servers from the official NSClient site.

[![Build Status](https://travis-ci.org/opentable/puppet-nsclient.png?branch=master)](https://travis-ci.org/opentable/puppet-nsclient)

Usage
--
The module consists of a single class

```puppet  
include 'nsclient'
```

Unless specified, this will install the latest stable build (0.4.1.101) of the nsclient for x64 machines. If you want to install a different version, then you can tell the module to do so:

```puppet
class { 'nsclient':
  package_source_location => 'http://myhost.com',
  package_name            => 'NSClient++ (Win32)'
  package_source          => '0.3.1.msi'
}
```

The default location and default package version can be found in params.pp. 

Setting Allowed Hosts
--

In order for our hosts to communicate back to Nagios / Icinga servers, we need to set the hosts. We can do this as follows:

```puppet
class { 'nsclient':
  allowed_hosts => ['172.16.0.3'],
}
```

```puppet
class { 'nsclient':
  allowed_hosts => ['10.21.0.0/22','10.21.4.0/22'],
}
```

Contribute:
--

* Fork it
* Create a branch
* Improve/fix (with spec tests)
* Push new branch
* Submit a PR
