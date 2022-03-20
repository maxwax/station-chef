#
# Cookbook:: station
# Recipe:: firefox-markdown
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

my = node['station']['user']

# Should already exist, created by GNOME et all
directory "/home/#{my['username']}/.local" do
  owner my['username']
  group my['group']
  mode '0700'
  action :create
end

# Should already exist, created by GNOME et all
directory "/home/#{my['username']}/.local/share" do
  owner my['username']
  group my['group']
  mode '0700'
  action :create
end

# Should already exist, created by GNOME et all
directory "/home/#{my['username']}/.local/share/mime" do
  owner my['username']
  group my['group']
  mode '0775'
  action :create
end

# Should already exist, created by GNOME et all
directory "/home/#{my['username']}/.local/share/mime/packages" do
  owner my['username']
  group my['group']
  mode '0775'
  action :create
end

cookbook_file "/home/#{my['username']}/.local/share/mime/packages/text-markdown.xml" do
  source 'home/local/share/mime/packages/text-markdown.xml'
  owner my['username']
  group my['group']
  mode '0644'
  action :create
end
