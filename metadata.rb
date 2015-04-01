name 'statsd'
maintainer 'Matt Stanford'
maintainer_email 'matthewjstanford@gmail.com'
license 'Apache 2.0'
description 'Installs and Configures statsd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

%w(apt build-essential git runit).each do |d|
  depends d
end

depends 'nodejs', '~> 2.2.0'

%w(amazon centos debian redhat scientific ubuntu).each do |os|
  supports os
end
