#
# Cookbook:: station
# Recipe:: skype
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

# my = node['station']['user']

# remote_file "#{node['station']['skype']['repo_filename']}" do
#   path "/etc/yum.repos.d/#{node['station']['skype']['repo_filename']}"
#   source "#{node['station']['skype']['repo_source']}/#{node['station']['skype']['repo_filename']}"
#
#   action :create
#
#   not_if { node['packages'].key?('skypeforlinux') ||
#            ::File.exist?("#{node['station']['skype']['repo_filename']}")
#   }
#
# end

yum_repository 'skype' do
  description 'Skype - Stable'
  baseurl 'https://repo.skype.com/rpm/stable/'
  enabled true
  gpgcheck true
  repo_gpgcheck true
  gpgkey 'https://repo.skype.com/data/SKYPE-GPG-KEY'

  make_cache true

  not_if { node['packages'].key?('skypeforlinux') }
end

package 'skypeforlinux' do
  action :install

  flush_cache [ :before ]

  not_if { node['packages'].key?('skypeforlinux') }
end
