#
# Cookbook:: station
# Recipe:: packages
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Install my standard set of packages for a specific version of Fedora Linux
#>
=end

install_packages = []

node['station']['install_packages'].each do |pkg_name, pkg_doc|
	install_packages << pkg_name
end

# Install any version of these packages
#package node['station']['install_packages'] do
package install_packages do
	action :install
end

# Remove these packages.  Careful, watch out for dependency removals
package node['station']['remove_packages'] do
	action :remove
end
