unless Chef::Config[:solo]
  results = search(:node, node['statsd']['graphite']['search_query'])

  unless results.empty?
    node.default['statsd']['config']['graphite']['host'] = graphite_results[0]['ipaddress']
  end
end
