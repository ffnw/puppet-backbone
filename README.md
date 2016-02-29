# puppet-backbone

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with backbone](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with backbone](#beginning-with-backbone)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Manages backbone connections.

## Setup

### Setup Requirements

* puppet modules
  * ffnw-network
  * ffnw-bird

### Beginning with backbone

```puppet
class { 'backbone': }
```

## Usage

```puppet
class { 'backbone':
  kernel_table => '42',
}

backbone::gre { 'srv01':
  endpoint  => '1.2.3.4',
  transfer  => '100.64.1.0/31',
  transfer6 => 'fc00::1/64',
}
```

## Reference

* class backbone
  * kernel_table (optional)

* define backbone::gre
  * endpoint
  * transfer
  * transfer6 (optional)

## Limitations

### OS compatibility
* Debian 8

### Dependencies
* ffnw-network
* ffnw-bird

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.

