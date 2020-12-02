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

remote_file "#{node['station']['skype']['repo_filename']}" do
  path "/etc/yum.repos.d/#{node['station']['skype']['repo_filename']}"
  source "#{node['station']['skype']['repo_source']}/#{node['station']['skype']['repo_filename']}"

  action :create

  not_if { File.exists?("#{node['station']['skype']['repo_filename']}")}

end

package 'skypeforlinux' do
  action :install

  flush_cache [ :before ]

  not_if { node['packages'].key?('skypeforlinux')}
end
