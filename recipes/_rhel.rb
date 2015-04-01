chef_gem 'fpm'

package 'rpmdevtools' do
  action :install
end

dir = "#{node['statsd']['tmp_dir']}/build/usr/share/statsd/"

directory dir do
  recursive true
end

git dir do
  repository node['statsd']['repo']
  reference node['statsd']['sha']
  action :sync
  notifies :run, 'execute[build rpm package]'
end

execute 'build rpm package' do
  command "fpm -s dir -t rpm -n statsd -a noarch -v #{node['statsd']['package_version']} ."
  cwd "#{node['statsd']['tmp_dir']}/build"
  creates "#{node['statsd']['tmp_dir']}/build/statsd-#{node['statsd']['package_version']}-1.noarch.rpm"
end

rpm_package 'statsd' do
  action :install
  source "#{node['statsd']['tmp_dir']}/build/statsd-#{node['statsd']['package_version']}-1.noarch.rpm"
end
