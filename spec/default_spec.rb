require 'spec_helper'

describe 'statsd::default' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new
    runner.converge('statsd::default')
  end

  # it 'installs update-notifier-common' do
  #   expect(chef_run).to install_package 'update-notifier-common'
  # end

  # it 'apt-get updates' do
  #   expect(chef_run).to execute_command 'apt-get update'
  # end

  it 'creates preseeding directory' do
    expect(chef_run).to create_directory('/etc/statsd')
  end
end
