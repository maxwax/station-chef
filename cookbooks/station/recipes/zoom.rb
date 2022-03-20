#
# Cookbook:: station
# Recipe:: zoom
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

my = node['station']['user']

remote_file 'zoom-rpm' do
  path "/home/#{my['username']}/Downloads/#{node['station']['zoom']['package_name']}"
  source "#{node['station']['zoom']['rpm_source']}/#{node['station']['zoom']['package_name']}"
  action :create

  not_if { node['packages'].key?('zoom') }
end

package node['station']['zoom']['package_name'] do
  source "/home/#{my['username']}/Downloads/#{node['station']['zoom']['package_name']}"
  action :install

  not_if { node['packages'].key?('zoom') }
end
