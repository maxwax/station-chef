#
# Cookbook:: station
# Recipe:: packages
#
# Copyright:: 2019, Maxwell Spangler, All Rights Reserved.

install_packages = []

node['station']['install_packages'].each do |pkg_name, _pkg_doc|
  install_packages << pkg_name
end

package node['station']['remove_packages'] do
  action :remove
end

package install_packages do
  action :install
end
