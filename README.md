# statsd cookbook
[![Open issues](https://img.shields.io/github/issues/matthewjstanford/statsd-cookbook.svg)][issues]
[![Build Status](https://img.shields.io/travis/matthewjstanford/statsd-cookbook.svg)][travis]

[issues]: https://github.com/matthewjstanford/statsd-cookbook/issues
[travis]: https://travis-ci.org/matthewjstanford/statsd-cookbook

## Supported Platforms

* Centos 6.5
* Centos 7.0
* Debian 7.8
* Fedora 20
* Fedora 21
* Ubuntu 12.04
* Ubuntu 14.04

## Attributes

### General

* `['statsd']['repo']` - Reference to a StatsD repository.
* `['statsd']['sha']` - Revision of repository to checkout.
* `['statsd']['package_version']` - The version to use when creating the package. Defaults to 0.6.0.

* `['statsd']['user']` - Will be used for process supervision
* `['statsd']['dir']` - Directory to install into.
* `['statsd']['conf_dir']` - Directory for StatsD configuration.

### Graphite search options

* `['statsd']['graphite']['use_search']` = false
* `['statsd']['graphite']['search_role']` = 'graphite\_server'
* `['statsd']['graphite']['search_query']` = "roles:#{node['statsd']['graphite']['search\_role']} AND chef\_environment:#{node.chef\_environment}"

### Statsd configuration

Every non-null attribute in the config section will be added to the statsd config file.

* `['statsd']['config']['flushInterval']` - interval (in ms) to flush metrics to each backend
* `['statsd']['config']['percentThreshold']` - for time information, calculate the Nth percentile(s) (can be a single value or list of floating-point values) negative values mean to use "top" Nth percentile(s) values [%, default: 90]
* `['statsd']['config']['address']` - address to listen on [default: 0.0.0.0]
* `['statsd']['port']` - port to listen for messages on [default: 8125]
* `['statsd']['config']['mgmt_address']` - address to run the management TCP interface on [default: 0.0.0.0]
* `['statsd']['config']['mgmt_port']` - port to run the management TCP interface on [default: 8126]
* `['statsd']['config']['deleteIdleStats']` - don't send values to graphite for inactive counters, sets, gauges, or timers as opposed to sending 0.  For gauges, this unsets the gauge (instead of sending the previous value). Can be individually overriden. [default: false]
* `['statsd']['config']['deleteTimers']` - don't send values to graphite for inactive timers, as opposed to sending 0 [default: false]
* `['statsd']['config']['deleteGauges']` - don't send values to graphite for inactive gauges, as opposed to sending the previous value [default: false]
* `['statsd']['config']['deleteSets']` - don't send values to graphite for inactive sets, as opposed to sending 0 [default: false]
* `['statsd']['config']['deleteCounters']` - don't send values to graphite for inactive counters, as opposed to sending 0 [default: false]
* `['statsd']['config']['debug']` - debug flag [default: false]
* `['statsd']['config']['dumpMessages']` - log all incoming messages [default: false]
* `['statsd']['config']['graphiteHost']` - hostname or IP of Graphite server
* `['statsd']['config']['graphitePort']` - port of Graphite server [default: 2003]

### Graphite Backend Configuration

* `['statsd']['config']['graphite']['legacyNamespace']` - use the legacy namespace [default: true]
* `['statsd']['config']['graphite']['globalPrefix']` - global prefix to use for sending stats to graphite [default: "stats"]
* `['statsd']['config']['graphite']['globalSuffix']` - global suffix to use for sending stats to graphite [default: ""] This is particularly useful for sending per host stats by settings this value to: require('os').hostname().split('.')[0]
* `['statsd']['config']['graphite']['prefixCounter']` - graphite prefix for counter metrics [default: "counters"]
* `['statsd']['config']['graphite']['prefixTimer']` - graphite prefix for timer metrics [default: "timers"]
* `['statsd']['config']['graphite']['prefixGauge']` - graphite prefix for gauge metrics [default: "gauges"]
* `['statsd']['config']['graphite']['prefixSet']` - graphite prefix for set metrics [default: "sets"]

## Usage

### statsd::default

Include `statsd` in your node's `run_list`:

## License and Authors

Author:: Matt Stanford (<matthewjstanford@gmail.com>)
