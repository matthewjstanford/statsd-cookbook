default['statsd']['package_version'] = '0.6.0'
default['statsd']['sha'] = 'd16d744e6424dfd519dc71795a212ad1c08c3114'
default['statsd']['user'] = 'statsd'
default['statsd']['repo'] = 'https://github.com/etsy/statsd.git'
default['statsd']['tmp_dir'] = Chef::Config[:file_cache_path]

default['statsd']['dir'] = '/usr/share/statsd'
default['statsd']['conf_dir'] = '/etc/statsd'

default['statsd']['graphite']['use_search'] = false
default['statsd']['graphite']['search_role'] = 'graphite_server'
default['statsd']['graphite']['search_query'] = "roles:#{node['statsd']['graphite']['search_role']} AND chef_environment:#{node.chef_environment}"

# Statsd configuration
default['statsd']['config']['flushInterval'] = 10_000
default['statsd']['config']['percentThreshold'] = 90
default['statsd']['config']['address'] = '0.0.0.0'
default['statsd']['config']['port'] = 8125
default['statsd']['config']['mgmt_address'] = '0.0.0.0'
default['statsd']['config']['mgmt_port'] = 8126
default['statsd']['config']['deleteIdleStats'] = false
default['statsd']['config']['deleteTimers'] = false
default['statsd']['config']['deleteGauges'] = false
default['statsd']['config']['deleteSets'] = false
default['statsd']['config']['deleteCounters'] = false
default['statsd']['config']['debug'] = false
default['statsd']['config']['dumpMessages'] = false
default['statsd']['config']['graphiteHost'] = nil
default['statsd']['config']['graphitePort'] = 2003

default['statsd']['config']['graphite']['legacyNamespace'] = true
default['statsd']['config']['graphite']['globalPrefix'] = 'stats'
default['statsd']['config']['graphite']['globalSuffix'] = ''
default['statsd']['config']['graphite']['prefixCounter'] = 'counters'
default['statsd']['config']['graphite']['prefixTimer'] = 'timers'
default['statsd']['config']['graphite']['prefixGauge'] = 'gauges'
default['statsd']['config']['graphite']['prefixSet'] = 'sets'
