include_recipe 'git'
include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'nodejs'
include_recipe 'runit'

chef_gem 'fpm'

build_dir = "#{node['statsd']['tmp_dir']}#{node['statsd']['dir']}"

directory build_dir do
  recursive true
end

git build_dir do
  repository node['statsd']['repo']
  reference node['statsd']['sha']
  action :sync
end

case node['platform_family']
when 'debian'
  include_recipe 'statsd::_debian'
when 'rhel'
  include_recipe 'statsd::_rhel'
end

include_recipe 'statsd::_graphite_search' if node['statsd']['graphite']['use_search']

directory node['statsd']['conf_dir']

template "#{node['statsd']['conf_dir']}/config.js" do
  mode '0644'
  source 'config.js.erb'
  notifies :restart, 'service[statsd]', :delayed
end

user node['statsd']['user'] do
  system true
  shell '/bin/false'
end

runit_service 'statsd' do
  action [:enable, :start]
  default_logger true
  options(
    user: node['statsd']['user'],
    statsd_dir: node['statsd']['dir'],
    conf_dir: node['statsd']['conf_dir']
  )
end
