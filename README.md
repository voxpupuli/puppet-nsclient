# NSClient++ module for Puppet

[![Build Status](https://travis-ci.org/voxpupuli/puppet-nsclient.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-nsclient)
[![Code Coverage](https://coveralls.io/repos/github/voxpupuli/puppet-nsclient/badge.svg?branch=master)](https://coveralls.io/github/voxpupuli/puppet-nsclient)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/nsclient.svg)](https://forge.puppetlabs.com/puppet/nsclient)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/nsclient.svg)](https://forge.puppetlabs.com/puppet/nsclient)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/nsclient.svg)](https://forge.puppetlabs.com/puppet/nsclient)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/nsclient.svg)](https://forge.puppetlabs.com/puppet/nsclient)

#### Table of Contents

1. [Overview](#overview)
1. [Module Description - What the module does and why it is useful](#module-description)
1. [Setup - The basics of getting started with nsclient](#setup)
    * [What nsclient affects](#what-nsclient-affects)
    * [Beginning with nsclient](#beginning-with-nsclient)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Overview

This is a module that will manage and install the NSClient on Windows servers
from the official NSClient site.

## Module Description

Module that will install the NSClient on windows servers to be able to interact
with Nagios and Icinga. It will also manage the list of hosts that the server can
communicate with.

## Setup

### What nsclient affects

* Installs a new package
* Creates a new windows service

### Beginning with nsclient

## Usage

To install nsclient with defaults:

```puppet
include 'nsclient'
```

To install a different version:

```puppet
class { 'nsclient':
  package_source_location => 'http://myhost.com',
  package_name            => 'NSClient++ (Win32)'
  package_source          => '0.3.1.msi'
}
```

In order to configure the nagios hosts to communicate with:

```puppet
class { 'nsclient':
  allowed_hosts => ['10.21.0.0/22','10.21.4.0/22'],
}
```

## Reference

### Classes and Defined Types

#### Class: `nsclient`

One of the primary classes of the nsclient module. This class will install the
nsclient binaries

**Parameters within `nsclient`:**

##### `allowed_hosts`

Array of hosts that your client can communicate with. You can use netmasks
(/ syntax) or * to create ranges.

##### `service_state`

Whether you want to nsclient service to start up. Defaults to running

##### `service_enable`

Whether you want to nsclient service to start up at boot. Defaults to true

##### `package_source_location`

This is the default site to download your package from (e.g. <http://files.nsclient.org/stable>)

##### `package_source`

This is the source name of the package to be downloaded

##### `package_name`

This is name of the package to download (e.g. NSCP-0.4.1.101-x64.msi)

##### `download_destination`

This is the folder to where we need to download the NSCP Installer. Package
cannot take a remote file source Because of Windows, we need to set this to be
a top level directory (e.g. c:\\temp) or we would need to recursively check the
file path.

##### `config_template`

This is the template to use as the config file.

## Reference

### Classes

#### Public Classes

* [`nsclient`](#class-nsclient): Guides the basic installation of the nsclient application

#### Private Classes

* [`nsclient::config`]  Manages all the default configuration of the nsclient application
* [`nsclient::install`] Manages the installation of the nsclient
* [`nsclient::service`] Manages the nclient service

## Limitations

This module is tested on the following platforms:

* Windows 2008 R2

It is tested with the OSS version of Puppet only.

## Development

### Contributing

Please read CONTRIBUTING.md for full details on contributing to this project.
