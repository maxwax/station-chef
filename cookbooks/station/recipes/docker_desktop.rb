#
# Cookbook:: station
# Recipe:: docker_desktop
#
# Copyright:: 2022, Maxwell Spangler, All Rights Reserved.

my = node['station']['user']

package node['station']['docker-desktop']['remove_conflict_packages'] do
  # package_name node['station']['docker-desktop']['remove_conflict_packages']

  action :remove

end

execute 'dnf-new-repo' do
    command 'dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo'

  not_if { ::File.exist?('/etc/yum.repos.d/docker-ce.repo') }
end

package node['station']['docker-engine']['package_list'] do
  action :install

  # not_if { node['packages'].key?('docker-desktop') }
end

docker_rpm_file = "/home/#{my['username']}/Downloads/#{node['station']['docker-desktop']['package_name']}"

remote_file 'docker-desktop-rpm' do
  path docker_rpm_file
  source node['station']['docker-desktop']['source_file']
  action :create

  not_if { node['packages'].key?('docker-desktop') && node['packages']['version'] == node['station']['docker-desktop']['version'] }
end

package node['station']['docker-desktop']['package_name'] do
  source docker_rpm_file
  action :install

  # Not if we have the package installed AND it matches our required version
  not_if { node['packages'].key?('docker-desktop') && node['packages']['version'] == node['station']['docker-desktop']['version'] }
end

file 'docker-desktop-rpm-cleanup' do
  path docker_rpm_file

  action :delete
end

service node['station']['docker-desktop']['service'] do
  action [:enable, :start]
end

group node['station']['docker-desktop']['docker_group'] do
  members my['username']

  action :create
end
