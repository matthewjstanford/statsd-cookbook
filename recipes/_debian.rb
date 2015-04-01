chef_gem 'fpm'

dir = "#{node['statsd']['tmp_dir']}/build/usr/share/statsd/"

directory dir do
  recursive true
end

git dir do
  repository node['statsd']['repo']
  reference node['statsd']['sha']
  action :sync
  notifies :run, 'execute[build debian package]'
end

package 'debhelper'

execute 'build debian package' do
  command "fpm -s dir -t deb -n statsd -a noarch -v #{node['statsd']['package_version']} ."
  cwd "#{node['statsd']['tmp_dir']}/build"
  creates "#{node['statsd']['tmp_dir']}/build/statsd_#{node['statsd']['package_version']}_all.deb"
end

package 'statsd' do
  action :install
  source "/tmp/build/statsd_#{node['statsd']['package_version']}_all.deb"
  provider Chef::Provider::Package::Dpkg
end
