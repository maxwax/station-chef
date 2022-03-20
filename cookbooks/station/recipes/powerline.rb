#
# Cookbook:: station
# Recipe:: powerline
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

my = node['station']['user']

# For some reason, using 'recursive true' causes the "middle" level directories to be owned by root. This way each is owned by user with proper permissions

directory "/home/#{my['username']}/.config/powerline" do
  owner my['username']
  group my['group']
  mode '0700'
  action :create
end

directory "/home/#{my['username']}/.config/powerline/themes" do
  owner my['username']
  group my['group']
  mode '0700'
  action :create
end

directory "/home/#{my['username']}/.config/powerline/themes/shell" do
  owner my['username']
  group my['group']
  mode '0700'
  recursive true
  action :create
end

cookbook_file "/home/#{my['username']}/.config/powerline/themes/shell/default_leftonly_maxwell.json" do
  source 'home/config/powerline/themes/shell/default_leftonly_maxwell.json'
  owner my['username']
  group my['group']
  mode '0644'
  action :create
end
