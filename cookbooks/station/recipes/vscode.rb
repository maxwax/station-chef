#
# Cookbook:: station
# Recipe:: vscode
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

my = node['station']['user']

short_package_name = node['station']['vscode']['short_package_name']

# WARNING: Order matters: Import the key IF NO REPO, THEN make the repo.

key_file = "/home/#{my['username']}/Downloads/vscode-gpgkey"

remote_file 'vscode-gpgkey' do
  path key_file
  source 'https://packages.microsoft.com/keys/microsoft.asc'
  action :create

  not_if { ::File.exist?('/etc/yum.repos.d/vscode.repo') }
end

# You must load keys with rpm --import and rpmkeys --import
# per https://access.redhat.com/solutions/3720351
execute 'import-vscode-gpgkey-rpmkeys' do
  command "rpmkeys --import #{key_file}"

  not_if { ::File.exist?('/etc/yum.repos.d/vscode.repo') }
end

# You must load keys with rpm --import and rpmkeys --import
# per https://access.redhat.com/solutions/3720351
execute 'import-vscode-gpgkey-rpm' do
  command "rpm --import #{key_file}"

  not_if { ::File.exist?('/etc/yum.repos.d/vscode.repo') }
end

yum_repository 'vscode' do
  description 'Visual Studio Code'
  baseurl 'https://packages.microsoft.com/yumrepos/vscode'
  enabled true
  gpgcheck true
  repo_gpgcheck true
  gpgkey 'https://packages.microsoft.com/keys/microsoft.asc'

  make_cache true

  not_if { ::File.exist?('/etc/yum.repos.d/vscode.repo') }
end

package node['station']['vscode']['package_name'] do
  action :install

  not_if { node['packages'].key?(short_package_name) }
end
