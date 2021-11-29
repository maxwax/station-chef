#
# Cookbook:: station
# Recipe:: etc_systemd
#
# Copyright:: 2019, The Authors, All Rights Reserved.

=begin
#<
Deploy configuration changes to systemd
#>
=end

cookbook_file "/etc/systemd/logind.conf" do
  source "etc/systemd/logind.conf"

  owner 'root'
  group 'root'
  mode 0644

  action :create
end
