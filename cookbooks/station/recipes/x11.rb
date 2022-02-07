#
# Cookbook:: station
# Recipe:: x11
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Configure Gnome Display Manager (GDM) to use X11 instead of Wayland for displays
#>
=end

#my = node['station']['user']

cookbook_file "/etc/gdm/custom.conf" do
  source "etc/gdm/custom.conf"
  owner 'root'
  group 'root'
  mode 0644
  action :create

  # The purpose of deploying this file is to put
  # WaylandEnable=false
  # within it to switch from Wayland to x11
  # so if this is present, don't re-deploy

  not_if { File.exists?("/etc/gdm/custom.conf") &&
           File.readlines("/etc/gdm/custom.conf").grep(/WaylandEnable=false/).any? }
end
