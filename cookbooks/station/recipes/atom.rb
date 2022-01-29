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

# WARNING: Order matters: Import the key IF NO REPO, THEN make the repo.

key_file = "/home/#{my['username']}/Downloads/atom-gpgkey"

remote_file "atom-gpgkey" do
  path key_file
  source "https://packagecloud.io/AtomEditor/atom/gpgkey"
  action :create

  not_if { File.exists?("/etc/yum.repos.d/atom.repo")}
end

# You must load keys with rpm --import and rpmkeys --import
# per https://access.redhat.com/solutions/3720351
execute 'import-atom-gpgkey-rpmkeys' do
  command "rpmkeys --import #{key_file}"

  not_if 'rpm -qa --qf "%{VERSION}-%{RELEASE} %{SUMMARY}\n" gpg-pubkey* | grep AtomEditor'
end

# You must load keys with rpm --import and rpmkeys --import
# per https://access.redhat.com/solutions/3720351
execute 'import-atom-gpgkey-rpm' do
  command "rpm --import #{key_file}"

  not_if 'rpm -qa --qf "%{VERSION}-%{RELEASE} %{SUMMARY}\n" gpg-pubkey* | grep AtomEditor'
end

cookbook_file "/etc/yum.repos.d/atom.repo" do
  source "etc/yum.repos.d/atom.repo"
  owner 'root'
  group 'root'
  mode 0644
  action :create

  not_if { File.exists?("/etc/yum.repos.d/atom.repo")}
end

package node['station']['atom']['package_name'] do
  action :install

  not_if { node['packages'].key?('atom') }
end
