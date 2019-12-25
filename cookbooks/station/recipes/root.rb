#
# Cookbook:: station
# Recipe:: user
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Configure root personal account with various customizations
#>
=end

# Just for each access later
root = node['station']['root']

root['personal_dot_files'].each do |fname|
  cookbook_file "/root/.#{fname}" do
    source "root/#{fname}"
    owner 'root'
    group 'root'
    mode 0755
    action :create
  end
end

directory "/root/bin" do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

root['personal_bin_scripts'].each do |fname|
  cookbook_file "/root/bin/#{fname}" do
    source "root/bin/#{fname}"
    owner 'root'
    group 'root'
    mode 0755
    action :create
  end
end