#
# Cookbook:: station
# Recipe:: other_groups
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Configure misc groups not directly associated with a user but used in this environment
#>
=end

# Just for each access later
my = node['station']['other_groups']

node['station']['other_groups'].each do |group_name, group_config|

  group group_name do
    gid group_config['gid']
    members group_config['members']
    append true
    action :create
  end
end
