#
# Cookbook:: station
# Recipe:: virtualbox
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Install the VirtualBox hypervisor
#>
=end

my = node['station']['user']

remote_file "virtualbox-fedora-repo" do
  path "/etc/yum.repos.d/virtualbox.repo"
  source node['station']['virtualbox']['repo_source']
  action :create

  not_if { File.exists?("/etc/yum.repos.d/virtualbox.repo")}
end

remote_file "oracle-signing-key" do
  path "/home/#{my['username']}/Downloads/#{node['station']['virtualbox']['signing_key_fname']}"
  source node['station']['virtualbox']['signing_key_source']
  action :create
end

execute 'install-oracle-key' do
  command "rpm --import /home/#{my['username']}/Downloads/#{node['station']['virtualbox']['signing_key_fname']}"
end

package node['station']['virtualbox']['package_name'] do
 action :install
end