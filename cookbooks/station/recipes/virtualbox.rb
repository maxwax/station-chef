#
# Cookbook:: station
# Recipe:: virtualbox
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

my = node['station']['user']

package node['station']['virtualbox']['package_name'] do
  action :install
end

group 'vboxusers' do
  append true
  members my['username']

  action :modify
end
