#
# Cookbook:: station
# Recipe:: other_groups
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

node['station']['other_groups'].each do |group_name, group_config|
  group group_name do
    gid group_config['gid']
    members group_config['members']
    append true
    action :create
  end
end
