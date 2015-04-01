require 'serverspec'
set :backend, :exec

describe 'statsd service' do
  it 'should be running' do
    expect(service('statsd')).to be_running
  end

  it 'listens on port 8125' do
    expect(port 8125).to be_listening 'tcp'
  end
end

describe 'statsd setup' do
  it 'config file exists' do
    expect(file('/etc/statsd/config.js')).to be_file
  end
end
