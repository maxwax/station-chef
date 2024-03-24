#
# Cookbook:: station
# Recipe:: atom
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

my = node['station']['user']

# 2024-0324 Just download the rpm
remote_file 'atom-rpm' do
  source 'https://github.com/atom/atom/releases/download/v1.60.0/atom.x86_64.rpm'
  path "/tmp/atom.x86_64.rpm"

  action :create

  not_if { node['packages'].key?('atom') }
end

# 2024-0324 Just install the rpm
package "/tmp/atom.x86_64.rpm" do
  action :install

  not_if { node['packages'].key?('atom') }
end

# WARNING: Order matters: Import the key IF NO REPO, THEN make the repo.

#key_file = "/home/#{my['username']}/Downloads/atom-gpgkey"

# remote_file 'atom-gpgkey' do
#   path key_file
#   source 'https://packagecloud.io/AtomEditor/atom/gpgkey'
#   action :create
#
#   not_if { ::File.exist?('/etc/yum.repos.d/atom.repo') }
# end

# You must load keys with rpm --import and rpmkeys --import
# per https://access.redhat.com/solutions/3720351
# execute 'import-atom-gpgkey-rpmkeys' do
#   command "rpmkeys --import #{key_file}"
#
#   not_if { node['packages'].key?('atom') }
# end
#
# You must load keys with rpm --import and rpmkeys --import
# per https://access.redhat.com/solutions/3720351
# execute 'import-atom-gpgkey-rpm' do
#   command "rpm --import #{key_file}"
#
#   not_if { node['packages'].key?('atom') }
# end
#
# yum_repository 'atom' do
#   description 'Atom Editor'
#   baseurl 'https://packagecloud.io/AtomEditor/atom/el/7/$basearch'
#   enabled true
#   gpgcheck false
#   repo_gpgcheck true
#   gpgkey 'https://packagecloud.io/AtomEditor/atom/gpgkey'
#
#   make_cache true
#
#   not_if { node['packages'].key?('atom') }
# end

# package node['station']['atom']['package_name'] do
#   action :install
#
#   not_if { node['packages'].key?('atom') }
# end
