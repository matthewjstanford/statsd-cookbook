package 'debhelper' do
  action :install
end

execute 'build debian package' do
  command "fpm -s dir -t deb -n statsd -a noarch -v #{node['statsd']['package_version']} ."
  cwd "#{node['statsd']['tmp_dir']}/build"
  creates "#{node['statsd']['tmp_dir']}/build/statsd_#{node['statsd']['package_version']}_all.deb"
  action :nothing
  subscribes :run, "git[#{node['statsd']['build_dir']}]", :immediately
end

package 'statsd' do
  action :install
  source "/tmp/build/statsd_#{node['statsd']['package_version']}_all.deb"
  provider Chef::Provider::Package::Dpkg
end
