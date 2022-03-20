#
# Cookbook:: station
# Recipe:: etc_config
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

root = node['station']['root']

node['station']['etc_config'].each do |fname|
  cookbook_file "/etc/#{fname}" do
    source "etc/#{fname}"
    owner 'root'
    group 'root'
    mode root['mode_config_file']
    action :create
  end
end
