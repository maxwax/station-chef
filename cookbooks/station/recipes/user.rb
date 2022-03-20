#
# Cookbook:: station
# Recipe:: user
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

# Just for each access later
my = node['station']['user']

group my['group'] do
  gid my['gid']
  action :create
end

user my['username'] do
  uid my['uid']
  gid my['group']
  action :create
end

# Include primary user in wheel group for sudo privs
group 'wheel' do
  members my['username']
  append true
  action :create
end

my['personal_dot_files'].each do |fname|
  cookbook_file "/home/#{my['username']}/.#{fname}" do
    source "home/#{fname}"
    owner my['username']
    group my['group']
    mode my['mode_config_file']
    action :create
  end
end

directory "/home/#{my['username']}/bin" do
  owner my['username']
  group my['group']
  mode my['mode_executable_file']
  action :create
end

my['personal_bin_scripts'].each do |fname|
  cookbook_file "/home/#{my['username']}/bin/#{fname}" do
    source "home/bin/#{fname}"
    owner my['username']
    group my['group']
    mode my['mode_executable_file']
    action :create
  end
end
