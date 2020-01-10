#
# Cookbook:: station
# Recipe:: shortcuts
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Install various .desktop files to enable Gnome command shorts to launch apps
#>
=end

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
    mode '0644'

    action :create
  end
end
