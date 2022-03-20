#
# Cookbook:: station
# Recipe:: shortcuts
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

root = node['station']['root']

directory node['station']['shortcuts']['dir'] do
  owner 'root'
  group 'root'
  mode '0755'

  action :create
end

node['station']['shortcuts']['files'].each do |fname|
  cookbook_file "#{node['station']['shortcuts']['dir']}/#{fname}.desktop" do
    source "usr/share/applications/station/#{fname}.desktop"
    owner 'root'
    group 'root'
    mode root['mode_config_file']

    action :create
  end
end
