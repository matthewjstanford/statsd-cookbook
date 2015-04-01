include_recipe 'git'
include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'nodejs'
include_recipe 'runit'

case node['platform_family']
when 'debian'
  include_recipe 'statsd::_debian'
when 'rhel'
  include_recipe 'statsd::_rhel'
end

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

# TODO: write lib to find nodejs

runit_service 'statsd' do
  action [:enable, :start]
  default_logger true
  options ({
    user: node['statsd']['user'],
    statsd_dir: node['statsd']['dir'],
    conf_dir: node['statsd']['conf_dir'],
    nodejs_bin: node['statsd']['nodejs_bin']
  })
end
