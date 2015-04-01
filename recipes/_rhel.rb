package 'rpmdevtools' do
  action :install
end

execute 'build rpm package' do
  command "fpm -s dir -t rpm -n statsd -a noarch -v #{node['statsd']['package_version']} ."
  cwd "#{node['statsd']['tmp_dir']}/build"
  creates "#{node['statsd']['tmp_dir']}/build/statsd-#{node['statsd']['package_version']}-1.noarch.rpm"
  action :nothing
  subscribes :run, "git[#{node['statsd']['build_dir']}]", :immediately
end

rpm_package 'statsd' do
  action :install
  source "#{node['statsd']['tmp_dir']}/build/statsd-#{node['statsd']['package_version']}-1.noarch.rpm"
end
