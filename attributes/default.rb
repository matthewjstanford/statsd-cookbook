default['statsd']['port'] = 8125
default['statsd']['package_version'] = '0.6.0'
default['statsd']['sha'] = 'd16d744e6424dfd519dc71795a212ad1c08c3114'
default['statsd']['user'] = 'statsd'
default['statsd']['repo'] = 'https://github.com/etsy/statsd.git'
default['statsd']['tmp_dir'] = '/tmp'

default['statsd']['dir'] = '/usr/share/statsd'
default['statsd']['conf_dir'] = '/etc/statsd'

default['statsd']['graphite']['use_search'] = false
default['statsd']['graphite']['search_role'] = 'graphite_server'
default['statsd']['graphite']['search_query'] = "roles:#{node['statsd']['graphite']['search_role']} AND chef_environment:#{node.chef_environment}"

# Statsd configuration
default['statsd']['config']['flush_interval'] = 10_000
default['statsd']['config']['percent_threshold'] = 90
default['statsd']['config']['address'] = '0.0.0.0'
default['statsd']['config']['mgmt_address'] = '0.0.0.0'
default['statsd']['config']['mgmt_port'] = 8126
default['statsd']['config']['delete_idle_stats'] = false
default['statsd']['config']['delete_timers'] = false
default['statsd']['config']['delete_gauges'] = false
default['statsd']['config']['delete_sets'] = false
default['statsd']['config']['delete_counters'] = false
default['statsd']['config']['debug'] = false
default['statsd']['config']['dump_messages'] = false

default['statsd']['config']['graphite']['legacy_namespace'] = true
default['statsd']['config']['graphite']['global_prefix'] = 'stats'
default['statsd']['config']['graphite']['global_suffix'] = ''
default['statsd']['config']['graphite']['prefix_counter'] = 'counters'
default['statsd']['config']['graphite']['prefix_timer'] = 'timers'
default['statsd']['config']['graphite']['prefix_gauge'] = 'gauges'
default['statsd']['config']['graphite']['prefix_set'] = 'sets'
default['statsd']['config']['graphite']['port'] = 2003
default['statsd']['config']['graphite']['host'] = nil
