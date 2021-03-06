# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`tls_checker`](#tls_checker): Configure tls_checker

### Defined types

* [`tls_checker::watch`](#tls_checkerwatch): summary Add TLS endpoints to monitor

### Functions

* [`tls_checker::watched_endpoints`](#tls_checkerwatched_endpoints): Extract watched TLS endpoints from PuppetDB

## Classes

### <a name="tls_checker"></a>`tls_checker`

Configure tls_checker

#### Parameters

The following parameters are available in the `tls_checker` class:

* [`package_provider`](#package_provider)
* [`tls_checker_path`](#tls_checker_path)
* [`logfile`](#logfile)
* [`ensure`](#ensure)
* [`hour`](#hour)
* [`minute`](#minute)
* [`month`](#month)
* [`monthday`](#monthday)
* [`weekday`](#weekday)
* [`user`](#user)
* [`group`](#group)

##### <a name="package_provider"></a>`package_provider`

Data type: `Enum['gem', 'puppet_gem']`

Which package provider to use

##### <a name="tls_checker_path"></a>`tls_checker_path`

Data type: `String`

Path to tls-checker

##### <a name="logfile"></a>`logfile`

Data type: `String`

Logfile to store certificates status

Default value: `'/var/log/tls-checker.jsonl'`

##### <a name="ensure"></a>`ensure`

Data type: `String`



Default value: `'installed'`

##### <a name="hour"></a>`hour`

Data type: `Any`



Default value: `'*/4'`

##### <a name="minute"></a>`minute`

Data type: `Any`



Default value: `fqdn_rand(60)`

##### <a name="month"></a>`month`

Data type: `Any`



Default value: ``undef``

##### <a name="monthday"></a>`monthday`

Data type: `Any`



Default value: ``undef``

##### <a name="weekday"></a>`weekday`

Data type: `Any`



Default value: ``undef``

##### <a name="user"></a>`user`

Data type: `Optional[String]`

User to check TLS status as

##### <a name="group"></a>`group`

Data type: `Optional[String]`

Group to check TLS status as

## Defined types

### <a name="tls_checkerwatch"></a>`tls_checker::watch`

summary Add TLS endpoints to monitor

#### Parameters

The following parameters are available in the `tls_checker::watch` defined type:

* [`endpoints`](#endpoints)

##### <a name="endpoints"></a>`endpoints`

Data type: `Variant[Array[String], String]`

Endpoints to monitor

Default value: `$title`

## Functions

### <a name="tls_checkerwatched_endpoints"></a>`tls_checker::watched_endpoints`

Type: Puppet Language

Extract watched TLS endpoints from PuppetDB

#### `tls_checker::watched_endpoints()`

The tls_checker::watched_endpoints function.

Returns: `Array[String]` An array of TLS endpoints

