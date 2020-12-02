#
# Cookbook:: station
# Recipe:: skype
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Install Microsoft Skype
#>
=end

my = node['station']['user']

cookbook_file "/etc/yum.repos.d/skype-repo.repo" do
  source "etc/yum.repos.d/skype-repo.repo"
  owner 'root'
  group 'root'
  mode 0755
  action :create

  not_if { File.exists?("/etc/yum.repos.d/skype-repo.repo")}
end

package 'skypeforlinux' do
  action :install

  not_if { node['packages'].key?('skypeforlinux')}
end
