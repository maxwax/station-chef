#
# Cookbook:: station
# Recipe:: atom
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Install the Atom text editor
#>
=end

my = node['station']['user']

remote_file "atom-rpm" do
  path "/home/#{my['username']}/Downloads/#{node['station']['atom']['package_name']}"
  source node['station']['atom']['rpm_source']
  action :create

  not_if { node['packages'].key?('atom') }
end

package node['station']['atom']['package_name'] do
  source "/home/#{my['username']}/Downloads/#{node['station']['atom']['package_name']}"
  action :install

  not_if { node['packages'].key?('atom') }
end