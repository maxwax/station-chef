#
# Cookbook:: station
# Recipe:: user
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Configure my personal account with various customizations
#>
=end

# Just for each access later
my = node['station']['user']

proxychains_config_dir = "/home/#{my['username']}/#{my['proxychains-ng']['config_dir']}"

directory proxychains_config_dir do
  owner my['username']
  group my['group']
  mode my['mode']
  action :create
end

my['proxychains-ng']['config_files'].each do |fname|
  cookbook_file "#{proxychains_config_dir}/#{fname}" do
    source "home/#{fname}"
    owner my['username']
    group my['group']
    mode '0644'
    action :create
  end
end

link "#{proxychains_config_dir}/#{my['proxychains-ng']['symlink_source']}" do
  to "#{proxychains_config_dir}/#{my['proxychains-ng']['symlink_dest']}"
  link_type :symbolic
end
