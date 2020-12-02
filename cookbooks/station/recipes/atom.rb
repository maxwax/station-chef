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

cookbook_file "/etc/yum.repos.d/atom.repo" do
  source "etc/yum.repos.d/atom.repo"
  owner 'root'
  group 'root'
  mode 0644
  action :create

  not_if { File.exists?("/etc/yum.repos.d/atom.repo")}
end

remote_file "atom-gpgkey" do
  path "/home/#{my['username']}/Downloads/atom-gpgkey"
  source "https://packagecloud.io/AtomEditor/atom/gpgkey"
  action :create

  not_if { File.exists?("/etc/yum.repos.d/atom.repo")}
end

execute 'import-atom-gpgkey' do
  command "rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey"

  not_if { File.exists?("/etc/yum.repos.d/atom.repo")}
end

package node['station']['atom']['package_name'] do
  action :install

  not_if { node['packages'].key?('atom') }
end
