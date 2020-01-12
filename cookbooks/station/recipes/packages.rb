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

puts
puts "DEBUG - show install packages"
puts
pp install_packages
puts

# Install any version of these packages
#package node['station']['install_packages'] do
package install_packages do
	action :install
end

# Broken 2019-12-18 will investigate later
# Might be Fedora | DNF issue
# node['station']['install_packages_versions'].each do |pkg_name, pkg_version|
# #	package "#{pkg_name}-#{pkg_version}" do
#   package "#{pkg_name}" do
# 		version pkg_version
# 		action :install
# 	end
# end

# Remove these packages.  Careful, watch out for dependency removals
package node['station']['remove_packages'] do
	action :remove
end
