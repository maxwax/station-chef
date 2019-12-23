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

yum_repository "virtualbox" do
  description "Oracle VirtualBox Fedora Repo"
  baseurl "http://download.virtualbox.org/virtualbox/rpm/fedora/$releasever/$basearch"
  gpgkey "gpgkey=https://www.virtualbox.org/download/oracle_vbox.asc"
  action :create
end

package node['station']['virtualbox']['package_name'] do
 action :install
end

group 'vboxusers' do
  append true
  members my['username']

  action :modify
end